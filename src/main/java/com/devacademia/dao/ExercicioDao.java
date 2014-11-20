/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.dao;

import com.devacademia.model.Exercicio;
import com.devacademia.model.Treino;
import com.devacademia.util.FabricaDeConexoes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author academia
 */
public class ExercicioDao {
    Connection conexao;
    Connection connection;

    public ExercicioDao(Connection connection) {
        this.connection = connection;
    }

    public ExercicioDao() {
        this.conexao = FabricaDeConexoes.getConnection();
    }

    public void adiciona(Exercicio exe) {
        // comando sql
        String sql = "insert into Treino"
                + "(Aluno_alu_id,Aparelho_apa_id,Instrutor_inst_id,tre_dia)" + "values(?,?,?,?);";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);
            Exercicio exerci = new Exercicio();
            List<Exercicio> exercicios= exerci.getExercicios();
            //for(Exercicio exe : exercicicios)
            // método set exige como parameto(indice,atributo do objeto)
            stmt.setInt(1, exe.getTreino().getAluno().getId());
            stmt.setInt(2, exe.getTreino().getAparelho().getId());
            stmt.setInt(3, exe.getTreino().getInstrutor().getId());
            stmt.setString(4,exe.getTreino().getDia());
            stmt.execute();
            stmt.close();
            
            String sql2 = "insert into Exercicio"
                    + "(exe_descricao,exe_grupomuscular,exe_serie,exe_repeticoes,exe_treinoid)" + "values(?,?,?,?,LAST_INSERT_ID());";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            // método set exige como parameto(indice,atributo do objeto)
            /*stmt2.setString(1, exe.getDescricao());
            stmt2.setString(2, exe.getGrupomuscular());
            stmt2.setInt(3, exe.getSerie());
            stmt2.setInt(4, exe.getRepeticoes());
            stmt2.setInt(5, exe.getTreinoid());
            */
            //stmt.setDate(4, new Date(exeinistrador.getCadastroNoSite().getTime()));
            // executa ação no Banco

            stmt2.execute();
            stmt2.close();
            //System.out.println("Adicionado com sucesso!");
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public List<Exercicio> getLista() {
        try {
            //cria um list do tipo Exercicio
            List<Exercicio> listaexercicios = new ArrayList<>();
            //cria objeto para injetar comando tipo select no banco
            PreparedStatement stmt = this.conexao
                    .prepareStatement("select A.exe_id,A.exe_descricao,A.exe_grupomuscular,A.exe_serie,A.exe_repeticoes,A.exe_trinoid,U.tre_id,U.Aluno_alu_id,U.Aparelho_apa_id,U.Instrutor_inst_id,U.tre_dia\n"
                            + "from Exercicio A join Treino U on (A.`exe_treinoid`=U.tre_id)");
            //objeto resultset consegue guardar valor encontrado
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Criando o objeto contato
                Exercicio exe = new Exercicio();
                //Seta no objeto contato o q "rs" pegou no banco
                exe.setId(rs.getInt("exe_id"));
              /*  exe.setDescricao(rs.getString("exe_descricao"));
                exe.setGrupomuscular(rs.getString("exe_grupomuscular"));
                exe.setSerie(rs.getInt("exe_serie"));
                exe.setRepeticoes(rs.getInt("exe_repeticoes"));*/
                exe.setTreinoid(rs.getInt("exe_treinoid"));
                Treino treino = new Treino();
                treino.setId(rs.getInt("tre_id"));
                treino.setDia(rs.getString("tre_dia"));

                exe.setTreino(treino);

                // adicionando objeto a lista
                listaexercicios.add(exe);
            }
            rs.close();
            stmt.close();
            System.out.println("listar ok");
            return listaexercicios;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void altera(Exercicio exe) {
        
        String sql = "update Treino set Aluno_alu_id=?,Aparelho_apa_id=?,Instrutor_inst_id=?,tre_dia=?"
                + "where tre_id=?;";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setInt(1, exe.getTreino().getAluno().getId());
            stmt.setInt(2, exe.getTreino().getAparelho().getId());
            stmt.setInt(3, exe.getTreino().getInstrutor().getId());
            stmt.setString(4,exe.getTreino().getDia());
            stmt.setInt(5, exe.getTreino().getId());
            stmt.execute();
            stmt.close();
            
            String sql2 = "update Exercicio set exe_descricao=?,exe_grupomuscular=?,exe_serie=?,exe_repeticoes=?,exe_treinoid=?"
                + "where Treino_tre_id=?";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            /* método set exige como parameto(indice,atributo do objeto)
            stmt2.setString(1, exe.getDescricao());
            stmt2.setString(2, exe.getGrupomuscular());
            stmt2.setInt(3, exe.getSerie());
            stmt2.setInt(4, exe.getRepeticoes());
            stmt2.setInt(5, exe.getTreinoid());
            stmt2.setInt(6, exe.getTreino().getId());
            stmt.setDate(4, new Date(exeinistrador.getCadastroNoSite().getTime()));
            */// executa ação no Banco

            stmt2.execute();
            stmt2.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void remove(Exercicio exe) {
        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement("delete from Treino where tre_id =?");
            stmt.setLong(1, exe.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    
}
