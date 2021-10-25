/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author t2s-user-cod197
 */
public class Data {
    private int dia;
    private int mês;
    private int ano;
    
    /**
     * Construtor que inicializa a data com 01/01/2000
     */
    public Data() {
        dia = 1;
        mês = 1;
        ano = 2000;
    }
    
    /**
     * Construtor que inicializa a data com os parâmetros
     * @param dia
     * @param mês
     * @param ano 
     */
    public Data(int dia, int mês, int ano) {
        this.setData(dia, mês, ano);
    }
    
    public void setData(int dia, int mês, int ano) {
        this.setDia(dia);
        this.setMês(mês);
        this.setAno(ano);
    }
    
    public String getData() {
        String data = "";
        if(dia < 10) data += "0";
        data += dia + "/";
        if(mês < 10) data += "0";
        data += mês + "/";
        data += ano;
        return data;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        if(dia < 1) this.dia = 1;
        else if(dia > 31) this.dia = 31;
        else this.dia = dia;
    }

    public int getMês() {
        return mês;
    }

    public void setMês(int mês) {
        if(mês < 1) this.mês = 1;
        else if(mês > 12) this.mês = 12;
        else this.mês = mês;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }
}