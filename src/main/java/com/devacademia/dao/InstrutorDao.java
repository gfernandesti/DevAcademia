/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.dao;

import com.devacademia.model.Instrutor;
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
public class InstrutorDao {
    
    Connection conexao;
    Connection connection;

    public InstrutorDao(Connection connection) {
        this.connection = connection;
    }

    public InstrutorDao() {
        this.conexao = FabricaDeConexoes.getConnection();
    }

    public void adiciona(Instrutor inst) {
        // comando sql
        String sql = "insert into Usuario"
                + "(usu_login,usu_senha,usu_permissao)" + "values(?,?,?);";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setString(1, inst.getUsuario().getLogin());
            stmt.setString(2, inst.getUsuario().getSenha());
            stmt.setString(3, String.valueOf(inst.getUsuario().getPermissao()));
            stmt.execute();
            stmt.close();
            
            String sql2 = "insert into Instrutor"
                    + "(inst_nome,inst_telefone,Usuario_usu_id,inst_email,inst_registro)" + "values(?,?,LAST_INSERT_ID(),?,?);";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            // método set exige como parameto(indice,atributo do objeto)
             stmt2.setString(1, inst.getNome());
            stmt2.setString(2, inst.getTelefone());
            stmt2.setString(3, inst.getEmail());
             stmt2.setInt(4, inst.getRegistro());
            
            //stmt.setDate(4, new Date(instinistrador.getCadastroNoSite().getTime()));
            // executa ação no Banco

            stmt2.execute();
            stmt2.close();
            //System.out.println("Adicionado com sucesso!");
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public List<Instrutor> getLista() {
        try {
            //cria um list do tipo Instrutor
            List<Instrutor> listadeinstrutores = new ArrayList<>();
            //cria objeto para injetar comando tipo select no banco
            PreparedStatement stmt = this.conexao
                    .prepareStatement("select A.inst_id,A.inst_nome,A.inst_telefone,A.inst_registro,A.inst_email,U.usu_id,U.usu_login,U.usu_senha,U.usu_permissao\n"
                            + "from Instrutor A join Usuario U on (A.`Usuario_usu_id`=U.usu_id)");
            //objeto resultset consegue guardar valor encontrado
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Criando o objeto contato
                Instrutor inst = new Instrutor();
                //Seta no objeto contato o q "rs" pegou no banco
                inst.setId(rs.getInt("inst_id"));
                inst.setNome(rs.getString("inst_nome"));
                inst.setTelefone(rs.getString("inst_telefone"));
                inst.setRegistro(rs.getInt("inst_registro"));
                inst.setEmail(rs.getString("inst_email"));
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usu_id"));
                usuario.setLogin(rs.getString("usu_login"));
                usuario.setSenha(rs.getString("usu_senha"));
                usuario.setPermissao(rs.getString("usu_permissao").charAt(0));

                inst.setUsuario(usuario);

                // adicionando objeto a lista
                listadeinstrutores.add(inst);
            }
            rs.close();
            stmt.close();
            System.out.println("listar ok");
            return listadeinstrutores;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void altera(Instrutor inst) {
        
        String sql = "update Usuario set usu_login=?,usu_senha=?,usu_permissao=?"
                + "where usu_id=?;";

        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setString(1, inst.getUsuario().getLogin());
            stmt.setString(2, inst.getUsuario().getSenha());
            stmt.setString(3, String.valueOf(inst.getUsuario().getPermissao()));
            stmt.setInt(4, inst.getUsuario().getId());
            stmt.execute();
            stmt.close();
            
            String sql2 = "update Instrutor set inst_telefone=?,inst_nome=?,inst_registro=?,inst_email=?"
                + "where Usuario_usu_id=?;";
            PreparedStatement stmt2;

            stmt2 = conexao.prepareStatement(sql2);

            // método set exige como parameto(indice,atributo do objeto)
            stmt2.setString(1, inst.getTelefone());
            stmt2.setString(2, inst.getNome());
            stmt2.setInt(3, inst.getRegistro());
            stmt2.setString(4, inst.getEmail());
            stmt2.setInt(5, inst.getUsuario().getId());
            //stmt.setDate(4, new Date(instinistrador.getCadastroNoSite().getTime()));
            // executa ação no Banco

            stmt2.execute();
            stmt2.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void remove(Instrutor inst) {
        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement("delete from Usuario where usu_id =?");
            stmt.setLong(1, inst.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    
    
}
