/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.dao;

import com.devacademia.model.Aluno;
import com.devacademia.model.Aparelho;
import com.devacademia.model.Exercicio;
import com.devacademia.model.Instrutor;
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
    static List<Exercicio> listaexercicios;

    public ExercicioDao(Connection connection) {
        this.connection = connection;
    }

    public ExercicioDao() {
        this.conexao = FabricaDeConexoes.getConnection();
    }

    public void adiciona(List<Exercicio> listaexercicios) throws SQLException {
        Exercicio exer = listaexercicios.get(0);
        // comando sql
        String sql = "insert into Treino"
                + "(Aluno_alu_id,Aparelho_apa_id,Instrutor_inst_id,tre_dia)" + "values(?,?,?,?);";

        PreparedStatement stmt;

        stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, exer.getTreino().getAluno().getId());
        stmt.setInt(2, exer.getTreino().getAparelho().getId());
        stmt.setInt(3, exer.getTreino().getInstrutor().getId());
        stmt.setString(4, exer.getTreino().getDia());
        stmt.execute();
        stmt.close();

        sql = "SELECT @last := LAST_INSERT_ID();";
        stmt = conexao.prepareStatement(sql);
        stmt.execute();
        stmt.close();

        for (Exercicio exe : listaexercicios) {
            String sql2 = "insert into Exercicio(exe_descricao,exe_grupomuscular,exe_serie,exe_repeticoes,exe_treinoid)" + "values(?,?,?,?,@last);";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            stmt2.setString(1, exe.getDescricao());
            stmt2.setString(2, exe.getGrupomuscular());
            stmt2.setInt(3, exe.getSerie());
            stmt2.setInt(4, exe.getRepeticoes());

            stmt2.execute();
            stmt2.close();

        }
        //System.out.println("Adicionado com sucesso!");

    }

    public List<Exercicio> getLista() {
        try {
            //cria um list do tipo Exercicio
            List<Exercicio> listaexercicios = new ArrayList<>();
            //cria objeto para injetar comando tipo select no banco
            PreparedStatement stmt = this.conexao
                    .prepareStatement("select * from Exercicio "
                            + "join Treino on (exe_treinoid=tre_id)"
                            + "join Aluno on (Aluno_alu_id= alu_id)"
                            + "join Aparelho on (Aparelho_apa_id= apa_id)"
                            + "join Instrutor on (Instrutor_inst_id= inst_id)");
            //objeto resultset consegue guardar valor encontrado
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Treino tre = new Treino();
                //Seta no objeto contato o q "rs" pegou no banco
                tre.setId(rs.getInt("tre_id"));
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
                // Criando o objeto contato
                Exercicio exe = new Exercicio();
                //Seta no objeto contato o q "rs" pegou no banco
                exe.setId(rs.getInt("exe_id"));
                exe.setDescricao(rs.getString("exe_descricao"));
                exe.setGrupomuscular(rs.getString("exe_grupomuscular"));
                exe.setSerie(rs.getInt("exe_serie"));
                exe.setRepeticoes(rs.getInt("exe_repeticoes"));
                exe.setTreinoid(rs.getInt("exe_treinoid"));
                
                exe.setAluno(aluno);
                exe.setAparelho(aparelho);
                exe.setInstrutor(instrutor);
                exe.setTreino(tre);
                
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
            stmt.setString(4, exe.getTreino().getDia());
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
