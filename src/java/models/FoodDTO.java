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
public class FoodDTO implements Serializable
{
    private String id,name,imageLink;
    private float price;
    private boolean isMain, isMain2,isSide,isAvailable;
    private int weekDay;

    public boolean isIsMain2() {
        return isMain2;
    }

    public void setIsMain2(boolean isMain2) {
        this.isMain2 = isMain2;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public FoodDTO(String id, String name, String imageLink, float price, boolean isMain, boolean isMain2, boolean isSide, boolean isAvailable, int weekDay) {
        this.id = id;
        this.name = name;
        this.imageLink = imageLink;
        this.price = price;
        this.isMain = isMain;
        this.isMain2 = isMain2;
        this.isSide = isSide;
        this.isAvailable = isAvailable;
        this.weekDay = weekDay;
    }


    public FoodDTO() {
    }




    public int getWeekDay() {
        return weekDay;
    }

    public void setWeekDay(int weekDay) {
        this.weekDay = weekDay;
    }


    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
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

    public boolean isIsMain() {
        return isMain;
    }

    public void setIsMain(boolean isMain) {
        this.isMain = isMain;
    }

    public boolean isIsSide() {
        return isSide;
    }

    public void setIsSide(boolean isSide) {
        this.isSide = isSide;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }
    
    
    
}
