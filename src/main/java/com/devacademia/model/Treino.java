/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.devacademia.model;

import java.util.Calendar;



/**
 *
 * @author academia
 */
public class Treino {
    private int id;
    private String sequencia;
    private String descricao;
    private String grupomuscular;
    private String exercicio;
    private Aluno aluno;
    private Aparelho aparelho;
    private Instrutor instrutor;
    private String dia;
    private Calendar horario;

    public int getId() {
        return id;
    }

    public String getSequencia() {
        return sequencia;
    }

    public String getDescricao() {
        return descricao;
    }

    public String getExercicio() {
        return exercicio;
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

    public Calendar getHorario() {
        return horario;
    }

    public String getGrupomuscular() {
        return grupomuscular;
    }

    public void setGrupomuscular(String grupomuscular) {
        this.grupomuscular = grupomuscular;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSequencia(String sequencia) {
        this.sequencia = sequencia;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setExercicio(String exercicio) {
        this.exercicio = exercicio;
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

    public void setHorario(Calendar horario) {
        this.horario = horario;
    }
    
    
    
    
    
            
    
    
}
