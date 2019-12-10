/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Date;


/**
 *
 * @author thmma
 */
public class UserDTO 
{
    private String userID,userFullName,username,userPassword,userEmail,userOrder,userComboOrder,role;
    private Date dateOrder;

    public UserDTO(String userID, String userFullName, String username, String userPassword, String userEmail, String userOrder, String userComboOrder, String role, Date dateOrder) {
        this.userID = userID;
        this.userFullName = userFullName;
        this.username = username;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
        this.userOrder = userOrder;
        this.userComboOrder = userComboOrder;
        this.role = role;
        this.dateOrder = dateOrder;
    }

    public UserDTO() {
    }

    public String getUserComboOrder() {
        return userComboOrder;
    }

    public void setUserComboOrder(String userComboOrder) {
        this.userComboOrder = userComboOrder;
    }

   
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserFullName() {
        return userFullName;
    }

    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserOrder() {
        return userOrder;
    }

    public void setUserOrder(String userOrder) {
        this.userOrder = userOrder;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }
    
    
}
