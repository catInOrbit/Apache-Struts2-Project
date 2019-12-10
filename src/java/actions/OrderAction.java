/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import models.UserDTO;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import services.DatabaseService;

/**
 *
 * @author thmma
 */
public class OrderAction implements SessionAware
{
    private String comboContent;
    private String orderContent;
    private final String SUCESS = "success";
    private final String ALREADY = "already";
    private final String MUSTHAVE = "must";

    private final String ERROR = "error";

    public String getOrderContent() {
        return orderContent;
    }

    public void setOrderContent(String orderContent) {
        this.orderContent = orderContent;
    }

    private Map<String,Object> session;
    

    public String getComboContent() {
        return comboContent;
    }

    public void setComboContent(String comboContent) {
        this.comboContent = comboContent;
    }
    
     public Map<String, Object> getSession() {
         return session;
    }
    
    public OrderAction() {
    }
    
    public String execute() throws Exception 
    {
        DatabaseService service = new DatabaseService();
        UserDTO currentUser = (UserDTO) session.get("UserAuth");
         HttpServletRequest request = ServletActionContext.getRequest();
         String[] combo = request.getParameterValues("comboDisk");
         String[] mainDisk1 = request.getParameterValues("mainDisk1");
         String[] mainDisk2 = request.getParameterValues("mainDisk2");
         String[] sideDisk = request.getParameterValues("sideDisk");

        
        String[] stringConcat = ArrayUtils.addAll(mainDisk1, mainDisk2);
        String[] stringConcatFinal = ArrayUtils.addAll(stringConcat, sideDisk);
        
        

        currentUser.setUserOrder(orderContent);
        currentUser.setUserComboOrder(comboContent);
        
        
        if(!service.checkOrderedInDay(currentUser.getUserID()))
        {
            
            if(combo == null)
            {
                request.setAttribute("ERROR_ORDER", "You must choose a combo");
                return MUSTHAVE;
            }
            
            if (service.insertOrder(currentUser.getUserID(), stringConcatFinal, combo)) {
                session.replace("UserAuth", currentUser);
                request.setAttribute("ORDER_SUCCESS", "Your order has been placed");
                return SUCESS;
            }
        }
        
        else
        {
            request.setAttribute("ERROR_ORDER", "Can not place more than 1 order in a day");
            return ALREADY;
        }
        
        
        
        return ERROR;
    }

    @Override
    public void setSession(Map<String, Object> map) 
    {
        this.session = map;
    }
    
}
