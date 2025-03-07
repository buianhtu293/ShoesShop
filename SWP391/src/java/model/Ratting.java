/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.Data;

import java.sql.Date;

@Data
public class Ratting {
    private int id;
    private int productId;
    private int userId;
    private int ratting;
    private String comment;
    private Date createAt;
    private Date modifiedAt;

    private User user;
    private Product product;
}
