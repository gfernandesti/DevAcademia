/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.model;

import java.util.ArrayList;


/**
 *
 * @author academia
 */
public class Exercicio {
    private int id;
    private String descricao;
    private int serie;
    private int repeticoes;
    private String grupomuscular;
    private int treinoid;
    private Aluno aluno;
    private Aparelho aparelho;
    private Instrutor instrutor;
    private Treino treino;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao ) {
        this.descricao = descricao;
    }

    public int getSerie() {
        return serie;
    }

    public void setSerie(int serie) {
        this.serie = serie;
    }

    public int getRepeticoes() {
        return repeticoes;
    }

    public void setRepeticoes(int repeticoes) {
        this.repeticoes = repeticoes;
    }

    public String getGrupomuscular() {
        return grupomuscular;
    }

    public void setGrupomuscular(String grupomuscular) {
        this.grupomuscular = grupomuscular;
    }

    public Treino getTreino() {
        return treino;
    }

    public void setTreino(Treino treino) {
        this.treino = treino;
    }

    public int getTreinoid() {
        return treinoid;
    }

    public void setTreinoid(int treinoid) {
        this.treinoid = treinoid;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public Aparelho getAparelho() {
        return aparelho;
    }

    public void setAparelho(Aparelho aparelho) {
        this.aparelho = aparelho;
    }

    public Instrutor getInstrutor() {
        return instrutor;
    }

    public void setInstrutor(Instrutor instrutor) {
        this.instrutor = instrutor;
    }
    
    
}
