/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.dao;

import com.devacademia.model.Aluno;
import com.devacademia.model.Aparelho;
import com.devacademia.model.Instrutor;
import com.devacademia.model.Treino;
import com.devacademia.model.Usuario;
import com.devacademia.util.FabricaDeConexoes;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author academia
 */
public class TreinoDao {
    
        Connection conexao;
    Connection connection;

    public TreinoDao(Connection connection) {
        this.connection = connection;
    }

    public TreinoDao() {
        this.conexao = FabricaDeConexoes.getConnection();
    }

    public void adiciona(Treino tre) {
        // comando sql
        String sql = "insert into Treino"
                + "(tre_descricao,tre_sequencia,tre_grupomuscular,tre_exercicio,Aluno_alu_id,"
                + "Aparelho_apa_id,Instrutor_inst_id,tre_dia)" + "values(?,?,?,?,?,?,?,?)";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setString(1, tre.getDescricao());
            stmt.setString(2, tre.getSequencia());
            stmt.setString(3, tre.getGrupomuscular());
            stmt.setString(4, tre.getExercicio());
            stmt.setInt(5, tre.getAluno().getId());
            stmt.setInt(6, tre.getAparelho().getId());
            stmt.setInt(7, tre.getInstrutor().getId());
            stmt.setString(8, tre.getDia());
            //stmt.setDate(9, new Date(tre.getHorario().getTimeInMillis()));
            stmt.execute();
            stmt.close();
           
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

    public List<Treino> getLista() {
        try {
            //cria um list do tipo Treino
            List<Treino> listadetreinos = new ArrayList<>();
            //cria objeto para injetar comando tipo select no banco
            PreparedStatement stmt = this.conexao
                    .prepareStatement("select * from Treino join Aluno on (Aluno_alu_id= alu_id)"
                            + "join Aparelho on (Aparelho_apa_id= apa_id)"
                            + "join Instrutor on (Instrutor_inst_id= inst_id);");
            //objeto resultset consegue guardar valor encontrado
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Criando o objeto contato
                Treino tre = new Treino();
                //Seta no objeto contato o q "rs" pegou no banco
                tre.setId(rs.getInt("tre_id"));
                tre.setDescricao(rs.getString("tre_descricao"));
                tre.setSequencia(rs.getString("tre_sequencia"));
                tre.setGrupomuscular(rs.getString("tre_grupomuscular"));
                tre.setExercicio(rs.getString("tre_exercicio"));
                tre.setDia(rs.getString("tre_dia"));
                
                Aluno aluno = new Aluno();
                aluno.setNome(rs.getString("alu_nome"));
                aluno.setEmail(rs.getString("alu_email"));
                aluno.setIdade(rs.getInt("alu_idade"));
                aluno.setTelefone(rs.getString("alu_telefone"));
                
                Aparelho aparelho = new Aparelho();
                aparelho.setDescricao(rs.getString("apa_descricao"));
                
                Instrutor instrutor = new Instrutor();
                instrutor.setNome(rs.getString("inst_nome"));
                
                tre.setAluno(aluno);
                tre.setAparelho(aparelho);
                tre.setInstrutor(instrutor);
                listadetreinos.add(tre);
            }
            rs.close();
            stmt.close();
            System.out.println("listar ok");
            return listadetreinos;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void altera(Treino tre) {
        
        String sql = "update Usuario set usu_login=?,usu_senha=?,usu_permissao=?"
                + "where usu_id=?;";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            stmt.execute();
            stmt.close();
            
            String sql2 = "update Treino set tre_telefone=?,tre_email=?,tre_nome=?,tre_registro=?,tre_idade=?"
                + "where Usuario_usu_id=?";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            // método set exige como parameto(indice,atributo do objeto)
            //stmt.setDate(4, new Date(treinistrador.getCadastroNoSite().getTime()));
            // executa ação no Banco

            stmt2.execute();
            stmt2.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void remove(Treino tre) {
        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement("delete from Treino where tre_id =?");
            stmt.setLong(1, tre.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    
}
