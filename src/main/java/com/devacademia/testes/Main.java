/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.testes;

import com.devacademia.dao.AdministradorDao;
import com.devacademia.model.Administrador;
import com.devacademia.model.Usuario;

/**
 *
 * @author academia
 */
public class Main {
    public static void main(String args[]){
        
        Usuario usuario = new Usuario();
        Administrador adm = new Administrador();
        
        usuario.setLogin("BBB");
        usuario.setSenha("pg");
        usuario.setPermissao('B');
        
        adm.setTelefone("22");
        adm.setEmail("fa@");
        adm.setNome("fabio");
        adm.setUsuario(usuario);
        
        System.out.println(adm.getUsuario().getLogin());
        System.out.println(adm.getUsuario().getSenha());
        
        
       // UsuarioDao usuarioDao = new UsuarioDao();
       // usuarioDao.adiciona(usuario);
        
        AdministradorDao administradorDao = new AdministradorDao();
        administradorDao.adiciona(adm);
        
        
    }
    
}
