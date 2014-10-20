/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.model;

/**
 *
 * @author academia
 */
public class Usuario {

    private int id;
    private String login;
    private String senha;
    private Character permissao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Character getPermissao() {
        return permissao;
    }

    public void setPermissao(Character permissao) {
        this.permissao = permissao;
    }
    
    

}
