/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import com.opensymphony.xwork2.ActionSupport;
import models.UserDTO;
import org.apache.struts2.ServletActionContext;
import services.DatabaseService;
import javax.servlet.http.HttpServletRequest;
/**
 *
 * @author thmma
 */
public class NewUserAction extends ActionSupport
{

    private String username,password,fullname,email;
     private DatabaseService service = new DatabaseService();

     private final String DUPP ="dupp";
    @Override
    public void validate()
    {
        if(service.checkDuplicatedUsername(username))
            addFieldError("ERROR", "Please choose another username");
    }
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    public NewUserAction() {
    }
    
    public String execute() throws Exception 
    {

        UserDTO user = new UserDTO(null, fullname, username, password, email, null, null, "user", null);
        HttpServletRequest request = ServletActionContext.getRequest();

        if(service.checkDuplicatedUsername(user.getUsername()))
        {
            request.setAttribute("ERROR_DUPP", "Username already exists");
            return DUPP;
        }
        
        else if(service.insertNewUser(user))
        {
            request.setAttribute("SUCCESS_REGISTER", "Registration successful, please login");
            return SUCCESS;
        }
        
        return ERROR;
    }
    
}
