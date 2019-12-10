/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.util.Map;
import models.UserDTO;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;
import services.DatabaseService;

/**
 *
 * @author thmma
 */
public class LoginAction extends ActionSupport implements SessionAware, ModelDriven
{
    private Map<String, Object> session;
    private UserDTO user = new UserDTO();
    private DatabaseService service = new DatabaseService();
    private final String ADMIN = "admin";
    public LoginAction() 
    {
        
    }
    
    @Override
    public void validate()
    {
        if (StringUtils.isEmpty(user.getUsername()))
            addFieldError("username", "Username can not be blank");
        
        if (StringUtils.isEmpty(user.getUserPassword()))
            addFieldError("userPassword", "Password can not be blank");
        
        user.setRole(service.checkLogin(user));
        
        if(user.getRole() ==  null)
        {
            addFieldError("username", "Unable to verify you");
        }
     
    }
    
    public String execute() throws Exception 
    {
        
        user = service.getUserInfo(user.getUsername());
        
        session.put("UserAuthRole", user.getRole());
        session.put("UserAuthID", user.getUserID());
        session.put("UserAuth", user);
        
        if(user.getRole().equals("Admin"))
            return ADMIN;

        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) 
    {
        this.session = map;
    }

    @Override
    public Object getModel() 
    {
        return user;
    }
    
}
