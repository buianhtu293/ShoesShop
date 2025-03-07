/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.Data;

import java.sql.Date;

@Data
public class CartItem {
    private int id;
    private int sessionId;
    private int productId;
    private int quantity;
    private Date createAt;
    private Date modifiedAt;

    private ShopingSession shopingSession;
}