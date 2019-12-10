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
public class ComboDTO implements Serializable
{
    private String comboID,comboName;
    private float comboPrice;

    public ComboDTO(String comboID, String comboName, float comboPrice) {
        this.comboID = comboID;
        this.comboName = comboName;
        this.comboPrice = comboPrice;
    }

    public ComboDTO() {
    }

    public String getComboID() {
        return comboID;
    }

    public void setComboID(String comboID) {
        this.comboID = comboID;
    }

    public String getComboName() {
        return comboName;
    }

    public void setComboName(String comboName) {
        this.comboName = comboName;
    }

    public float getComboPrice() {
        return comboPrice;
    }

    public void setComboPrice(float comboPrice) {
        this.comboPrice = comboPrice;
    }
    
    
}
