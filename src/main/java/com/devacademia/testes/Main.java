/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.testes;

import com.devacademia.dao.UsuarioDao;
import com.devacademia.model.Usuario;

/**
 *
 * @author academia
 */
public class Main {
    public static void main(String args[]){
        
        Usuario usuario = new Usuario();
        
        usuario.setId(1);
        usuario.setLogin("fatec");
        usuario.setSenha("pg");
        usuario.setPermissao('A');
        
        UsuarioDao usuarioDao = new UsuarioDao();
        usuarioDao.adiciona(usuario);
        
        
    }
    
}
