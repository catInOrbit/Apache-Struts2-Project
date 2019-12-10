/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;

/**
 *
 * @author thmma
 */
public class OrderDetailDTO implements Serializable
{
    private String orderDetailID,orderID,comboID,foodID;

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getComboID() {
        return comboID;
    }

    public void setComboID(String comboID) {
        this.comboID = comboID;
    }

    public String getFoodID() {
        return foodID;
    }

    public void setFoodID(String foodID) {
        this.foodID = foodID;
    }

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(String orderDetailID, String orderID, String comboID, String foodID) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.comboID = comboID;
        this.foodID = foodID;
    }
}
