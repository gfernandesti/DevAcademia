/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.dao;

import com.devacademia.model.Aluno;
import com.devacademia.model.Usuario;
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
public class AlunoDao {
    
    Connection conexao;
    Connection connection;

    public AlunoDao(Connection connection) {
        this.connection = connection;
    }

    public AlunoDao() {
        this.conexao = FabricaDeConexoes.getConnection();
    }

    public void adiciona(Aluno alu) {
        // comando sql
        String sql = "insert into Usuario"
                + "(usu_login,usu_senha,usu_permissao)" + "values(?,?,?);";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setString(1, alu.getUsuario().getLogin());
            stmt.setString(2, alu.getUsuario().getSenha());
            stmt.setString(3, String.valueOf(alu.getUsuario().getPermissao()));
            stmt.execute();
            stmt.close();
            
            String sql2 = "insert into Aluno"
                    + "(alu_telefone,alu_email,alu_nome,alu_registro,alu_idade,Usuario_usu_id)" + "values(?,?,?,?,?,LAST_INSERT_ID());";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            // método set exige como parameto(indice,atributo do objeto)
            stmt2.setString(1, alu.getTelefone());
            stmt2.setString(2, alu.getEmail());
            stmt2.setString(3, alu.getNome());
            stmt2.setInt(4, alu.getRegistro());
            stmt2.setInt(5, alu.getIdade());
            
            //stmt.setDate(4, new Date(aluinistrador.getCadastroNoSite().getTime()));
            // executa ação no Banco

            stmt2.execute();
            stmt2.close();
            //System.out.println("Adicionado com sucesso!");
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public List<Aluno> getLista() {
        try {
            //cria um list do tipo Aluno
            List<Aluno> listadealunos = new ArrayList<>();
            //cria objeto para injetar comando tipo select no banco
            PreparedStatement stmt = this.conexao
                    .prepareStatement("select A.alu_id,A.alu_nome,A.alu_telefone,A.alu_email,A.alu_registro,A.alu_idade,U.usu_id,U.usu_login,U.usu_senha,U.usu_permissao\n"
                            + "from Aluno A join Usuario U on (A.`Usuario_usu_id`=U.usu_id)");
            //objeto resultset consegue guardar valor encontrado
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Criando o objeto contato
                Aluno alu = new Aluno();
                //Seta no objeto contato o q "rs" pegou no banco
                alu.setId(rs.getInt("alu_id"));
                alu.setNome(rs.getString("alu_nome"));
                alu.setTelefone(rs.getString("alu_telefone"));
                alu.setEmail(rs.getString("alu_email"));
                alu.setRegistro(rs.getInt("alu_registro"));
                alu.setIdade(rs.getInt("alu_idade"));
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usu_id"));
                usuario.setLogin(rs.getString("usu_login"));
                usuario.setSenha(rs.getString("usu_senha"));
                usuario.setPermissao(rs.getString("usu_permissao").charAt(0));

                alu.setUsuario(usuario);

                // adicionando objeto a lista
                listadealunos.add(alu);
            }
            rs.close();
            stmt.close();
            System.out.println("listar ok");
            return listadealunos;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void altera(Aluno alu) {
        
        String sql = "update Usuario set usu_login=?,usu_senha=?,usu_permissao=?"
                + "where usu_id=?;";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setString(1, alu.getUsuario().getLogin());
            stmt.setString(2, alu.getUsuario().getSenha());
            stmt.setString(3, String.valueOf(alu.getUsuario().getPermissao()));
            stmt.setInt(4, alu.getUsuario().getId());
            stmt.execute();
            stmt.close();
            
            String sql2 = "update Aluno set alu_telefone=?,alu_email=?,alu_nome=?,alu_registro=?,alu_idade=?"
                + "where Usuario_usu_id=?";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            // método set exige como parameto(indice,atributo do objeto)
            stmt2.setString(1, alu.getTelefone());
            stmt2.setString(2, alu.getEmail());
            stmt2.setString(3, alu.getNome());
            stmt2.setInt(4, alu.getRegistro());
            stmt2.setInt(5, alu.getIdade());
            stmt2.setInt(6, alu.getUsuario().getId());
            //stmt.setDate(4, new Date(aluinistrador.getCadastroNoSite().getTime()));
            // executa ação no Banco

            stmt2.execute();
            stmt2.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void remove(Aluno alu) {
        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement("delete from Usuario where usu_id =?");
            stmt.setLong(1, alu.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    
}
