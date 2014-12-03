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
public class Treino {
    private int id;
    private Aluno aluno;
    private Aparelho aparelho;
    private Instrutor instrutor;
    private Exercicio exercicio;
    private String dia;


    public int getId() {
        return id;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public Aparelho getAparelho() {
        return aparelho;
    }

    public Instrutor getInstrutor() {
        return instrutor;
    }

    public String getDia() {
        return dia;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public void setAparelho(Aparelho aparelho) {
        this.aparelho = aparelho;
    }

    public void setInstrutor(Instrutor instrutor) {
        this.instrutor = instrutor;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public Exercicio getExercicio() {
        return exercicio;
    }

    public void setExercicio(Exercicio exercicio) {
        this.exercicio = exercicio;
    }
    


    
    
    
    
    
            
    
    
}
