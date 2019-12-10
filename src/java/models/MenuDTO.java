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
public class MenuDTO implements Serializable
{
    private String id,name;
    private int dayInWeek;
    private Date dateCreated;

    private HashSet<String> foodIDs = new HashSet<>();
    private HashSet<String> comboIDs = new HashSet<>();
     private HashSet<FoodDTO> menuFoodList = new HashSet<>();
    private HashMap<String, HashSet<FoodDTO>> comboFoodList = new HashMap<>();
    private HashMap<String, Float> comboPrice = new HashMap<>();

    public HashMap<String, Float> getComboPrice() {
        return comboPrice;
    }

    public void setComboPrice(HashMap<String, Float> comboPrice) {
        this.comboPrice = comboPrice;
    }

    

    public HashMap<String, HashSet<FoodDTO>> getComboFoodList() {
        return comboFoodList;
    }

    public void setComboFoodList(HashMap<String, HashSet<FoodDTO>> comboFoodList) {
        this.comboFoodList = comboFoodList;
    }

    
    public HashSet<String> getComboIDs() {
        return comboIDs;
    }

    public void setComboIDs(HashSet<String> comboIDs) {
        this.comboIDs = comboIDs;
    }

   

    public HashSet<String> getFoodIDs() {
        return foodIDs;
    }

    public void setFoodIDs(HashSet<String> foodIDs) {
        this.foodIDs = foodIDs;
    }


    public HashSet<FoodDTO> getMenuFoodList() {
        return menuFoodList;
    }

    public void setMenuFoodList(HashSet<FoodDTO> menuFoodList) {
        this.menuFoodList = menuFoodList;
    }
    

    public MenuDTO(String id, String name, String content, String comboContent, int dayInWeek, Date dateCreated) {
        this.id = id;
        this.name = name;
        this.dayInWeek = dayInWeek;
        this.dateCreated = dateCreated;
    }

    
    
    public MenuDTO() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDayInWeek() {
        return dayInWeek;
    }

    public void setDayInWeek(int dayInWeek) {
        this.dayInWeek = dayInWeek;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }
    
    
    
}
