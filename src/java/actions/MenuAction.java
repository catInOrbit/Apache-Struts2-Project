package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import models.ComboDTO;
import models.FoodDTO;
import models.MenuDTO;
import models.OrderDTO;
import models.UserDTO;
import org.apache.struts2.interceptor.SessionAware;
import services.DatabaseService;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author thmma
 */
public class MenuAction extends ActionSupport implements SessionAware
{
    private final String ADMINROLE="admin";

    
    private DatabaseService databaseService = new DatabaseService();
    private ArrayList<MenuDTO> menuModel = new ArrayList<>();
    private HashMap<UserDTO, ArrayList<OrderDTO>> userAndOrdersList;
    private Map<String, Object> session;
    private MenuDTO todayMenu;
   
    
    
    public MenuAction() 
    {
        
    }
    
    
    public String execute() throws Exception 
    {
        menuModel = databaseService.getMenus();
        menuModel = databaseService.populateMenuList(menuModel);
        todayMenu = databaseService.getTodayMenu();
        todayMenu = databaseService.populateSingleMenu(todayMenu);
        
        for(MenuDTO menuDTO : menuModel)
        {
            for(String comboID : menuDTO.getComboFoodList().keySet())
                databaseService.setComboPrice(menuDTO.getComboFoodList().get(comboID), comboID);

            for(String comboID : menuDTO.getComboFoodList().keySet())
                menuDTO.getComboPrice().put(comboID, databaseService.getComboPrice(comboID));
        }
        
        
        String userRole = (String) session.get("UserAuthRole");
        if(userRole.trim().equals(ADMINROLE))
        {
            userAndOrdersList = new HashMap<>();
            HashSet<UserDTO> tempUserList = databaseService.getAllUsers();
            
            for(UserDTO user : tempUserList)
            {
                ArrayList<OrderDTO> tempOrderList = databaseService.getOrders(user.getUserID());
                userAndOrdersList.put(user, tempOrderList);
            }
            
            return ADMINROLE;
        }
        
        
        return SUCCESS;
    }

    public ArrayList<MenuDTO> getMenuModel() {
        return menuModel;
    }

    public void setMenuModel(ArrayList<MenuDTO> menuModel) {
        this.menuModel = menuModel;
    }

  
     public MenuDTO getTodayMenu() {
        return todayMenu;
    }

    public void setTodayMenu(MenuDTO todayMenu) {
        this.todayMenu = todayMenu;
    }

    @Override
    public void setSession(Map<String, Object> map) 
    {
        this.session = map;
    }

    public HashMap<UserDTO, ArrayList<OrderDTO>> getUserAndOrdersList() {
        return userAndOrdersList;
    }

    public void setUserAndOrdersList(HashMap<UserDTO, ArrayList<OrderDTO>> userAndOrdersList) {
        this.userAndOrdersList = userAndOrdersList;
    }
    
    

}
