/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.util.Date;
import lombok.Data;

/**
 *
 * @author tungl
 */
@Data

public class OrderDetail {

    private int id;
    private int productId;
    private int shopOrderId;
    private int quantity;
    private double price;
    private Date createdAt;
    private Date modifiedAt;

    private Product product;
    private User user;

    public String getImgView() {
        return product.getImg1();
    }

    public String getNameView() {
        return product.getName();
    }

    public String getPriceName() {
        return product.getPrice() + "$";
    }
}
