/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.dao;

import com.devacademia.model.Atendente;
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
public class AtendenteDao {
        Connection conexao;
    Connection connection;

    public AtendenteDao(Connection connection) {
        this.connection = connection;
    }

    public AtendenteDao() {
        this.conexao = FabricaDeConexoes.getConnection();
    }

    public void adiciona(Atendente atd) {
        // comando sql
        String sql = "insert into Usuario"
                + "(usu_login,usu_senha,usu_permissao)" + "values(?,?,?);";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setString(1, atd.getUsuario().getLogin());
            stmt.setString(2, atd.getUsuario().getSenha());
            stmt.setString(3, String.valueOf(atd.getUsuario().getPermissao()));
            stmt.execute();
            stmt.close();
            
            String sql2 = "insert into Atendente"
                    + "(atd_registro,atd_nome,Usuario_usu_id)" + "values(?,?,LAST_INSERT_ID());";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            // método set exige como parameto(indice,atributo do objeto)
            stmt2.setInt(1, atd.getRegistro());
            stmt2.setString(2, atd.getNome());
            // executa ação no Banco

            stmt2.execute();
            stmt2.close();
            //System.out.println("Adicionado com sucesso!");
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public List<Atendente> getLista() {
        try {
            //cria um list do tipo Atendente
            List<Atendente> listadeatdinistradores = new ArrayList<>();
            //cria objeto para injetar comando tipo select no banco
            PreparedStatement stmt = this.conexao
                    .prepareStatement("select A.atd_id,A.atd_nome,A.atd_registro,U.usu_id,U.usu_login,U.usu_senha,U.usu_permissao\n"
                            + "from Atendente A join Usuario U on (A.`Usuario_usu_id`=U.usu_id)");
            //objeto resultset consegue guardar valor encontrado
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Criando o objeto contato
                Atendente atdinistrador = new Atendente();
                //Seta no objeto contato o q "rs" pegou no banco
                atdinistrador.setId(rs.getInt("atd_id"));
                atdinistrador.setNome(rs.getString("atd_nome"));
                atdinistrador.setRegistro(rs.getInt("atd_registro"));
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usu_id"));
                usuario.setLogin(rs.getString("usu_login"));
                usuario.setSenha(rs.getString("usu_senha"));
                usuario.setPermissao(rs.getString("usu_permissao").charAt(0));

                atdinistrador.setUsuario(usuario);

                // adicionando objeto a lista
                listadeatdinistradores.add(atdinistrador);
            }
            rs.close();
            stmt.close();
            System.out.println("listar ok");
            return listadeatdinistradores;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void altera(Atendente atd) {
        
        String sql = "update Usuario set usu_login=?,usu_senha=?,usu_permissao=?"
                + "where usu_id=?;";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setString(1, atd.getUsuario().getLogin());
            stmt.setString(2, atd.getUsuario().getSenha());
            stmt.setString(3, String.valueOf(atd.getUsuario().getPermissao()));
            stmt.setInt(4, atd.getUsuario().getId());
            stmt.execute();
            stmt.close();
            
            String sql2 = "update Atendente set atd_registro=?,atd_nome=?"
                + "where Usuario_usu_id=?;";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            // método set exige como parameto(indice,atributo do objeto)
            stmt2.setInt(1, atd.getRegistro());
            stmt2.setString(2, atd.getNome());
            stmt2.setInt(3, atd.getUsuario().getId());
            //stmt.setDate(4, new Date(atdinistrador.getCadastroNoSite().getTime()));
            // executa ação no Banco

            stmt2.execute();
            stmt2.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void remove(Atendente atd) {
        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement("delete from Usuario where usu_id =?");
            stmt.setLong(1, atd.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
    