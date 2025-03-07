/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import lombok.Data;

/**
 *
 * @author Admin
 */
@Data
public class ErrorStatus {

    private int statusCode;
    private String message;

    public ErrorStatus(int statusCode, String message) {
        this.statusCode = statusCode;
        this.message = message;
    }

    public ErrorStatus() {
    }

}
