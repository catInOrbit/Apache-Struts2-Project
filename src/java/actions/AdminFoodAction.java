/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import java.util.HashSet;
import javax.servlet.http.HttpServletRequest;
import models.FoodDTO;
import models.MenuDTO;
import org.apache.struts2.ServletActionContext;
import services.DatabaseService;

/**
 *
 * @author thmma
 */
public class AdminFoodAction 
{
    private String selectedMenuID,selectedFoodID,selectedComboID,selectedUserID,actionRequested;
    private String foodNameNew,foodImageNew,newComboName,imageLink;
    private float foodPriceNew;
    private boolean isMainDisk,isMainDisk2,isSideDisk;
    
    private final String EDIT = "edit";
    private final String REMOVE = "remove";
    private final String ADD = "add";
    private final String ERROR = "error";
    private final String UPDATESUCCESS = "updateSuccess";
    private final String SUCCESS = "success";
    
    private HttpServletRequest request;
    
    private HashSet<FoodDTO> allFoodList = null;

    
    
    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public HashSet<FoodDTO> getAllFoodList() {
        return allFoodList;
    }

    public void setAllFoodList(HashSet<FoodDTO> allFoodList) {
        this.allFoodList = allFoodList;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }
    

    public String getSelectedComboID() {
        return selectedComboID;
    }

    public void setSelectedComboID(String selectedComboID) {
        this.selectedComboID = selectedComboID;
    }

    public String getSelectedUserID() {
        return selectedUserID;
    }

    public void setSelectedUserID(String selectedUserID) {
        this.selectedUserID = selectedUserID;
    }

    
    
    
    public String getNewComboName() {
        return newComboName;
    }

    public void setNewComboName(String newComboName) {
        this.newComboName = newComboName;
    }



    
    public String getFoodNameNew() {
        return foodNameNew;
    }

    public void setFoodNameNew(String foodNameNew) {
        this.foodNameNew = foodNameNew;
    }

    public String getFoodImageNew() {
        return foodImageNew;
    }

    public void setFoodImageNew(String foodImageNew) {
        this.foodImageNew = foodImageNew;
    }

    public float getFoodPriceNew() {
        return foodPriceNew;
    }

    public void setFoodPriceNew(float foodPriceNew) {
        this.foodPriceNew = foodPriceNew;
    }

    public boolean isIsMainDisk() {
        return isMainDisk;
    }

    public void setIsMainDisk(boolean isMainDisk) {
        this.isMainDisk = isMainDisk;
    }

    public boolean isIsMainDisk2() {
        return isMainDisk2;
    }

    public void setIsMainDisk2(boolean isMainDisk2) {
        this.isMainDisk2 = isMainDisk2;
    }

    public boolean isIsSideDisk() {
        return isSideDisk;
    }

    public void setIsSideDisk(boolean isSideDisk) {
        this.isSideDisk = isSideDisk;
    }




    public String getSelectedMenuID() {
        return selectedMenuID;
    }

    public void setSelectedMenuID(String selectedMenuID) {
        this.selectedMenuID = selectedMenuID;
    }

    public String getSelectedFoodID() {
        return selectedFoodID;
    }

    public void setSelectedFoodID(String selectedFoodID) {
        this.selectedFoodID = selectedFoodID;
    }

    public String getActionRequested() {
        return actionRequested;
    }

    public void setActionRequested(String actionRequested) {
        this.actionRequested = actionRequested;
    }

    
    public AdminFoodAction() {
    }
    
    public String execute() throws Exception 
    {
        DatabaseService service = new DatabaseService();
         request = ServletActionContext.getRequest();
        if(actionRequested.equals("Edit"))
        {
            actionRequested = "Request_Update";
            FoodDTO foodDTO = service.getFoodWithID(selectedFoodID);
            
            request.setAttribute("selectedDTO", foodDTO);
            return EDIT;
        }
        else if(actionRequested.equals("Add_new"))
        {
            actionRequested = "Request_Add";
            request.setAttribute("selectedMenu", selectedMenuID);
            
            allFoodList = service.getAllFoodsForDisplay();
            return ADD;
        }
        
        else if(actionRequested.equals("Add_new_combo"))
        {
            actionRequested = "Request_Add_Combo";
            MenuDTO selectedMenuDTO = service.getSingleMenu(selectedMenuID);
            selectedMenuDTO = service.populateSingleMenu(selectedMenuDTO);
            request.setAttribute("selectedMenu", selectedMenuID);
            request.setAttribute("selectedMenuDTO", selectedMenuDTO);
            
            return ADD;
        }
        else if (actionRequested.equals("Remove"))
        {
            if(service.removeItemFromMenu("Food", selectedMenuID, selectedFoodID))
                return REMOVE;
        }
        
        else if(actionRequested.equals("Request_Update"))
        {
            System.out.println("At request add");
            

            FoodDTO foodDTO = new FoodDTO(selectedFoodID, foodNameNew, imageLink, foodPriceNew, isMainDisk, isMainDisk2, isSideDisk, true, 0);
           
            if(service.updateFood(foodDTO))
            {
                System.out.println("At request add success");

                return UPDATESUCCESS;
            }
        }
        
        else if(actionRequested.equals("Request_Add"))
        {
            FoodDTO foodDTO = new FoodDTO(selectedFoodID, foodNameNew, imageLink, foodPriceNew, isMainDisk, isMainDisk2, isSideDisk, true, 0);
            if(service.addNewItemToMenu(selectedMenuID, service.insertNewFood(foodDTO), null))
                return UPDATESUCCESS;

        }
        
        else if(actionRequested.equals("Request_New_Combo"))
        {
            String[] foodIds = request.getParameterValues("selectFoodToCombo");
            String comboId = service.addNewCombo(newComboName);

            boolean success = false;
            for(String foodID : foodIds)
            {
                
                if(service.addNewItemToMenu(selectedMenuID, foodID, comboId))
                    success = true;
                else
                    success = false;
            }
            
            if(success)
                return UPDATESUCCESS;

        }
        
        else if(actionRequested.equals("Remove_Combo"))
        {
            if(service.removeItemFromMenu("Combo", selectedMenuID, selectedComboID))
                return SUCCESS;
        }
        
        else if(actionRequested.equals("Remove_User"))
        {
            if(service.removeUser(selectedUserID))
                return UPDATESUCCESS;
        }
        
        else if(actionRequested.equals("Request_Add_From_DB"))
        {
             request = ServletActionContext.getRequest();
             String[] foodIDs = request.getParameterValues("foodFromDB");
             boolean success = false;
             for(String foodID : foodIDs)
             {
                 service.enableFood(foodID);
                 if(service.addNewItemToMenu(selectedMenuID, foodID, null))
                     success = true;
             }
             
             if(success)
                 return UPDATESUCCESS;
             else
                return ERROR;

        }
        
        return ERROR;
    }
    
}
