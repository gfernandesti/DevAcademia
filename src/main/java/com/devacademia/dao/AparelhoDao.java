/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.dao;

import com.devacademia.model.Aparelho;
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
public class AparelhoDao {
     Connection conexao;
    Connection connection;

    public AparelhoDao(Connection connection) {
        this.connection = connection;
    }

    public AparelhoDao() {
        this.conexao = FabricaDeConexoes.getConnection();
    }

    public void adiciona(Aparelho apa) {
            try{
            String sql = "insert into Aparelho"
                    + "(apa_codigo,apa_descricao,apa_notafiscal,apa_quantidade)" + "values(?,?,?,?);";
            PreparedStatement stmt;

            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setInt(1, apa.getCodigo());
            stmt.setString(2, apa.getDescricao());
            stmt.setString(3, apa.getNotafiscal());
            stmt.setInt(4, apa.getQuantidade());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public List<Aparelho> getLista() {
        try {
            //cria um list do tipo Aparelho
            List<Aparelho> listadeapanos = new ArrayList<>();
            //cria objeto para injetar comando tipo select no banco
            PreparedStatement stmt = this.conexao
                    .prepareStatement("select A.apa_id,A.apa_codigo,A.apa_notafiscal,A.apa_quantidade,A.apa_descricao from Aparelho A ;");
            //objeto resultset consegue guardar valor encontrado
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Criando o objeto contato
                Aparelho apa = new Aparelho();
                //Seta no objeto contato o q "rs" pegou no banco
                apa.setId(rs.getInt("apa_id"));
                apa.setCodigo(rs.getInt("apa_codigo"));
                apa.setDescricao(rs.getString("apa_descricao"));
                apa.setNotafiscal(rs.getString("apa_notafiscal"));
                apa.setQuantidade(rs.getInt("apa_quantidade"));
             
                // adicionando objeto a lista
                listadeapanos.add(apa);
            }
            rs.close();
            stmt.close();
            System.out.println("listar ok");
            return listadeapanos;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void altera(Aparelho apa) {
        
        try {
           
            String sql = "update Aparelho set apa_codigo=?,apa_descricao=?,apa_notafiscal=?,apa_quantidade=?"
                + " where apa_id=?";
            PreparedStatement stmt;

            stmt = conexao.prepareStatement(sql);

            // método set exige como parameto(indice,atributo do objeto)
            stmt.setInt(1, apa.getCodigo());
            stmt.setString(2, apa.getDescricao());
            stmt.setString(3, apa.getNotafiscal());
            stmt.setInt(4, apa.getQuantidade());
            stmt.setInt(5, apa.getId());
            stmt.execute();
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void remove(Aparelho apa) {
        PreparedStatement stmt;
        try {
            stmt = conexao.prepareStatement("delete from Aparelho where apa_id =?");
            stmt.setLong(1, apa.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    
}
