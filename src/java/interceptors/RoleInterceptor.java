/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptors;


/**
 *
 * @author thmma
 */
    
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;

/**
 * @author Tarun Tyagi
 *
 */
@SuppressWarnings("serial")
public class RoleInterceptor extends AbstractInterceptor  
{

    private String accessPrivilege;
    

    public String getAccessPrivilege() {
        return accessPrivilege;
    }

    public void setAccessPrivilege(String accessPrivilege) {
        this.accessPrivilege = accessPrivilege;
    }
    

    
    @Override
    public String intercept(ActionInvocation invocation) throws Exception 
    {
        System.out.println("ROLE INTERCEPTOR RUNNING ------------------");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
         Map session = invocation.getInvocationContext().getSession();

        String currentRole = null;
        currentRole = (String) session.get("UserAuthRole");

        
        if(currentRole == null )
        {
            return "unauth";
        }
        
        else if(accessPrivilege != null)
        {
             if(accessPrivilege.equals("admin") && !currentRole.equals("admin"))
             {
                 System.out.println("Unauthorized user entry");
                return "unauth";
             }
        }
        
        
        
        return invocation.invoke();
    }



   
    
}
