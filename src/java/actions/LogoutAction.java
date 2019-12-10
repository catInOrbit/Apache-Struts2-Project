/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author thmma
 */
public class LogoutAction extends ActionSupport implements SessionAware
{
    private Map<String, Object> session;
    public LogoutAction() 
    {
    }
    
    public String execute() throws Exception 
    {
        if(!session.isEmpty())
            session.clear();
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) 
    {
        this.session = map;
    }
    
}
