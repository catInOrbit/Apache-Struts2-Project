/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import models.OrderDTO;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import services.DatabaseService;

/**
 *
 * @author thmma
 */
public class DisplayAction extends ActionSupport implements SessionAware
{
    private Map<String, Object> session;
    private ArrayList<OrderDTO> orders, ordersSearched;
    private OrderDTO currentSelectedOrder;
    private String chosenOrderID, searchPattern;

    public ArrayList<OrderDTO> getOrdersSearched() {
        return ordersSearched;
    }

    public void setOrdersSearched(ArrayList<OrderDTO> ordersSearched) {
        this.ordersSearched = ordersSearched;
    }

    
    public String getSearchPattern() {
        return searchPattern;
    }

    public void setSearchPattern(String searchPattern) {
        this.searchPattern = searchPattern;
    }
    

    public String getChosenOrderID() {
        return chosenOrderID;
    }

    public void setChosenOrderID(String chosenOrderID) {
        this.chosenOrderID = chosenOrderID;
    }


    public OrderDTO getCurrentSelectedOrder() {
        return currentSelectedOrder;
    }

    public void setCurrentSelectedOrder(OrderDTO currentSelectedOrder) {
        this.currentSelectedOrder = currentSelectedOrder;
    }


    public ArrayList<OrderDTO> getOrders() {
        return orders;
    }

    public void setOrders(ArrayList<OrderDTO> orders) {
        this.orders = orders;
    }
    
    public DisplayAction() {
    }
    
    public String execute() throws Exception 
    {
         HttpServletRequest request = ServletActionContext.getRequest();
         DatabaseService service = new DatabaseService();
         String userID = (String) session.get("UserAuthID");
         
         
          if(searchPattern != null)
              ordersSearched = service.getOrderBySearch(userID, searchPattern);
          
            orders = service.getOrders(userID);
          
        for(OrderDTO order : orders)
        {
            for(String comboID : order.getComboLists().keySet())
                order.getComboPrice().put(comboID, service.getComboPrice(comboID.trim()));
        }

       
          
          if(chosenOrderID == null && orders.size() > 0)
                currentSelectedOrder = orders.get(0);
          else
          {
              for(OrderDTO order : orders)
              {
                  if(order.getOrderID().equals(chosenOrderID))
                  {
                        currentSelectedOrder = order;
                        break;
                  }
              }
          }

         
         return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) 
    {
        this.session = map;
    }
    
}
