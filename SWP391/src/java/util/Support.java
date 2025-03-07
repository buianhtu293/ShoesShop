/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.List;

/**
 *
 * @author Nhat Anh
 */
public class Support {
    
    public static String printArray(String[] array){
        String result="";
        for(String element : array){
            result = result + "'"+element+"'" + ", ";
        }
        return result.substring(0, result.length()-2);
    }
    
    public static String printArray(int[] array){
        String result="";
        for(int element : array){
            result = result + element + ", ";
        }
        return result.substring(0, result.length()-2);
    }
    public static boolean exist(String name, String[] array){
        for(String a : array){
            if(name.equalsIgnoreCase(a)){
                return true;
            }
        }
        return false;
    }
    
    public static int average(Integer[] array){
        int result =0;
        int count = 0;
        for(Integer a : array) {
            result+=a;
            count++;
        }
        return result/count;
    }
}
