/**
 * Created by Manuel on 04/07/2016.
 */
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class Jogada {

    int matrix[][];
    int matrixVerifier[][];
    int tamanho;

    public Jogada(int size){

        this.tamanho = size;

        matrixVerifier = new int[size+2][size+2];

        for (int i = 0; i < size+2; i++){
            for(int j = 0; j < size+2; j++) {
                matrixVerifier[i][j] = 0;
                }
            }
        }

    public int[][] apagar(int matriz[][]){



        return matriz;
    }
    }





