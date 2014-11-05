/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.dao;

import com.devacademia.model.Administrador;
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
public class AdministradorDao {

    Connection conexao;
    Connection connection;

    public AdministradorDao(Connection connection) {
        this.connection = connection;
    }

    public AdministradorDao() {
        this.conexao = FabricaDeConexoes.getConnection();
    }

    public void adiciona(Administrador adm) {
        // comando sql
        String sql = "insert into Usuario"
                + "(usu_login,usu_senha,usu_permissao)" + "values(?,?,?);";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setString(1, adm.getUsuario().getLogin());
            stmt.setString(2, adm.getUsuario().getSenha());
            stmt.setString(3, String.valueOf(adm.getUsuario().getPermissao()));
            stmt.execute();
            stmt.close();
            
            String sql2 = "insert into Administrador"
                    + "(adm_tel,adm_email,adm_nome,Usuario_usu_id)" + "values(?,?,?,LAST_INSERT_ID());";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            // método set exige como parameto(indice,atributo do objeto)
            stmt2.setString(1, adm.getTelefone());
            stmt2.setString(2, adm.getEmail());
            stmt2.setString(3, adm.getNome());
            //stmt.setDate(4, new Date(administrador.getCadastroNoSite().getTime()));
            // executa ação no Banco

            stmt2.execute();
            stmt2.close();
            //System.out.println("Adicionado com sucesso!");
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public List<Administrador> getLista() {
        try {
            //cria um list do tipo Administrador
            List<Administrador> listadeadministradores = new ArrayList<>();
            //cria objeto para injetar comando tipo select no banco
            PreparedStatement stmt = this.conexao
                    .prepareStatement("select A.adm_id,A.adm_nome,A.adm_tel,A.adm_email,U.usu_id,U.usu_login,U.usu_senha,U.usu_permissao\n"
                            + "from Administrador A join Usuario U on (A.`Usuario_usu_id`=U.usu_id)");
            //objeto resultset consegue guardar valor encontrado
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Criando o objeto contato
                Administrador administrador = new Administrador();
                //Seta no objeto contato o q "rs" pegou no banco
                administrador.setId(rs.getInt("adm_id"));
                administrador.setNome(rs.getString("adm_nome"));
                administrador.setTelefone(rs.getString("adm_tel"));
                administrador.setEmail(rs.getString("adm_email"));
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usu_id"));
                usuario.setLogin(rs.getString("usu_login"));
                usuario.setSenha(rs.getString("usu_senha"));
                usuario.setPermissao(rs.getString("usu_permissao").charAt(0));

                administrador.setUsuario(usuario);

                // adicionando objeto a lista
                listadeadministradores.add(administrador);
            }
            rs.close();
            stmt.close();
            System.out.println("listar ok");
            return listadeadministradores;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void altera(Administrador adm) {
        
        String sql = "update Usuario set usu_login=?,usu_senha=?,usu_permissao=?"
                + "where usu_id=?;";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setString(1, adm.getUsuario().getLogin());
            stmt.setString(2, adm.getUsuario().getSenha());
            stmt.setString(3, String.valueOf(adm.getUsuario().getPermissao()));
            stmt.setInt(4, adm.getUsuario().getId());
            stmt.execute();
            stmt.close();
            
            String sql2 = "update Administrador set adm_tel=?,adm_email=?,adm_nome=?"
                + "where Usuario_usu_id=?;";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            // método set exige como parameto(indice,atributo do objeto)
            stmt2.setString(1, adm.getTelefone());
            stmt2.setString(2, adm.getEmail());
            stmt2.setString(3, adm.getNome());
            stmt2.setInt(4, adm.getUsuario().getId());
            //stmt.setDate(4, new Date(administrador.getCadastroNoSite().getTime()));
            // executa ação no Banco

            stmt2.execute();
            stmt2.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void remove(Administrador administrador) {
        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement("delete from Usuario where usu_id =?");
            stmt.setLong(1, administrador.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
