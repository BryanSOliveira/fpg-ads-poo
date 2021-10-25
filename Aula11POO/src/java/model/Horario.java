/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author t2s-user-cod197
 */
public class Horario {
    private int horas;
    private int minutos;
    private int segundos;

    /**
     * Construtor que inicializa com a hora atual
     */
    public Horario() {
        horas = LocalDateTime.now().getHour();
        minutos = LocalDateTime.now().getMinute();
        segundos = LocalDateTime.now().getSecond();
    }
    
    /**
     * Construtor que inicializa com os parâmetros
     * @param horas
     * @param minutos
     * @param segundos 
     */
    public Horario(int horas, int minutos, int segundos) {
        this.horas = horas;
        this.minutos = minutos;
        this.segundos = segundos;
    }
    
    public String getHorario() {
        String horario = "";
        if(horas < 10) horario += "0";
        horario += horas + ":";
        if(minutos < 10) horario += "0";
        horario += minutos + ":";
        if(segundos < 10) horario += "0";
        horario += segundos;
        return horario;
    }
}