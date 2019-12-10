/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashMap;
import java.util.HashSet;

/**
 *
 * @author thmma
 */
public class OrderDTO implements Serializable
{
    private String orderID,customerID;
    private Date dateOrdered;
    private boolean status;
    private float price;

    
    private HashSet<FoodDTO> foodLists;
    private HashMap<String, HashSet<FoodDTO>> comboLists;
    private HashMap<String, Float> comboPrice;

    public HashMap<String, Float> getComboPrice() {
        return comboPrice;
    }

    public void setComboPrice(HashMap<String, Float> comboPrice) {
        this.comboPrice = comboPrice;
    }
    

    public HashSet<FoodDTO> getFoodLists() {
        return foodLists;
    }

    public void setFoodLists(HashSet<FoodDTO> foodLists) {
        this.foodLists = foodLists;
    }

    public HashMap<String, HashSet<FoodDTO>> getComboLists() {
        return comboLists;
    }

    public void setComboLists(HashMap<String, HashSet<FoodDTO>> comboLists) {
        this.comboLists = comboLists;
    }

    public OrderDTO(String orderID, String customerID, Date dateOrdered, boolean status, float price) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.dateOrdered = dateOrdered;
        this.status = status;
        this.price = price;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    


   

    public OrderDTO() 
    {
        foodLists = new HashSet<>();
        comboLists= new HashMap<>();
        comboPrice = new HashMap<>();
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public Date getDateOrdered() {
        return dateOrdered;
    }

    public void setDateOrdered(Date dateOrdered) {
        this.dateOrdered = dateOrdered;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
