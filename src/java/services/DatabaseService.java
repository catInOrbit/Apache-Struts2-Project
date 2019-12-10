/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import connections.ConnectionClass;
import java.io.Serializable;
import static java.rmi.server.LogStream.log;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import models.FoodDTO;
import models.MenuDTO;
import models.OrderDTO;
import models.UserDTO;
import org.apache.commons.lang3.time.DateUtils;

/**
 *
 * @author thmma
 */
public class DatabaseService implements Serializable
{
    
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;
    private Connection connection;

    public boolean closeConnection()
    {
        try
        {
            if(resultSet != null)
                resultSet.close();
            if(preparedStatement != null)
                preparedStatement.close();
            if(connection != null)
                connection.close();
            
            return false;
        }
        
        catch(Exception e)
        {
            e.printStackTrace();
            log(e.getMessage());
        }
        
        return true;
    }
    
    
    public FoodDTO getFoodWithID(String id)
    {
        FoodDTO model = null;
        try
        {
            connection = ConnectionClass.getConnection();
            
            if(connection != null)
            {
                String connectionString = "SELECT FoodID,FoodName,Price,ImageLink,isMainDisk,isMainDisk2,isSideDisk,isAvailable FROM tableFood Where FoodID=?";
                preparedStatement = connection.prepareStatement(connectionString);
                preparedStatement.setString(1, id);


                resultSet = preparedStatement.executeQuery();
                if(resultSet.next())
                {
                    model = new FoodDTO();
                    model.setId(resultSet.getString("FoodID"));
                    model.setName(resultSet.getString("FoodName"));
                    model.setPrice(resultSet.getFloat("Price"));
                    model.setImageLink(resultSet.getString("ImageLink"));
                    model.setIsMain(resultSet.getBoolean("isMainDisk"));
                    model.setIsMain2(resultSet.getBoolean("isMainDisk2"));
                    model.setIsSide(resultSet.getBoolean("isSideDisk"));
                    model.setIsAvailable(resultSet.getBoolean("isAvailable"));
                }
            }
            
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            log(e.getMessage());
        }
        
        return model;
    }
    
   
    public HashMap<String, HashSet<FoodDTO>> getComboFoodWithID(HashSet<String> comboIDs, String menuID)
    {
         HashMap<String, HashSet<FoodDTO>> result = new HashMap<>();
         HashSet<FoodDTO> tempFoodDTOs ;
        FoodDTO model = null;
          String connectionString;
        try
        {
            connection = ConnectionClass.getConnection();
            ArrayList<String> tempFoodIDs = new ArrayList<>();
            
            if(connection != null)
            {
                for(String comboID : comboIDs)
                {
                    tempFoodDTOs = new HashSet<>();
//                    String connectionString = "SELECT FoodID,FoodName,Price,ImageLink,isMainDisk,isMainDisk2,isSideDisk,isAvailable FROM tableFood Where FoodID=?";
                    connectionString = "SELECT FoodID from FoodList Where ComboID=? And MenuID=?";

                    preparedStatement = connection.prepareStatement(connectionString);
                    preparedStatement.setString(1, comboID);
                    preparedStatement.setString(2, menuID);



                    resultSet = preparedStatement.executeQuery();

                    while(resultSet.next())
                    {
                        model = new FoodDTO();
                        model.setId(resultSet.getString("FoodID"));
                        tempFoodDTOs.add(model);
                    }
                    
                    result.put(comboID, tempFoodDTOs);
                    
                }
                
                    for(String key : result.keySet())
                    {
                        tempFoodDTOs = new HashSet<>(result.get(key));
                        
                        for(FoodDTO food : tempFoodDTOs)
                        {
                            connectionString = "SELECT FoodName,Price,ImageLink,isMainDisk,isMainDisk2,isSideDisk,isAvailable FROM tableFood Where FoodID=?";

                            preparedStatement = connection.prepareStatement(connectionString);
                            preparedStatement.setString(1, food.getId());
                            resultSet = preparedStatement.executeQuery();

                            if (resultSet.next()) {
                                
                                food.setName(resultSet.getString("FoodName"));
                                food.setPrice(resultSet.getFloat("Price"));
                                food.setImageLink(resultSet.getString("ImageLink"));
                                food.setIsMain(resultSet.getBoolean("isMainDisk"));
                                food.setIsMain2(resultSet.getBoolean("isMainDisk2"));
                                food.setIsSide(resultSet.getBoolean("isSideDisk"));
                                food.setIsAvailable(resultSet.getBoolean("isAvailable"));
                            }
                        }
                        
                        result.replace(key, tempFoodDTOs);
                    }
                    
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            log(e.getMessage());
        }
        
        finally
        {
            closeConnection();
        }
        
        return result;
    } 
    
    
    public ArrayList<MenuDTO> getMenus()
    {
        ArrayList<MenuDTO> foodList = new ArrayList<>();
        MenuDTO menu;
        String currentMenuID = "";
        
        //TODO Also try to get comboID

        try
        {
            connection = ConnectionClass.getConnection();
            
            if(connection != null)
            {
                
                String connectionString = "SELECT ID,Name,Date,DayInWeek From tableMenu";
                preparedStatement = connection.prepareStatement(connectionString);

                resultSet = preparedStatement.executeQuery();
                while(resultSet.next())
                {

                     menu = new MenuDTO();
                    menu.setId(resultSet.getString("ID"));
                    menu.setName(resultSet.getString("Name"));
                    menu.setDateCreated(resultSet.getDate("Date"));
                    menu.setDayInWeek(resultSet.getInt("DayInWeek"));

                    foodList.add(menu);

                }
                
                for(MenuDTO menu1 : foodList)
                {
                    connectionString = "Select FoodID,ComboID from FoodList Where MenuID=?";
                    preparedStatement = connection.prepareStatement(connectionString);
                    preparedStatement.setString(1, menu1.getId());
                    resultSet = preparedStatement.executeQuery();

                    while (resultSet.next()) {
                        menu1.getFoodIDs().add(resultSet.getString("FoodID"));
                        menu1.getComboIDs().add(resultSet.getString("ComboID"));
                    }
                }
              
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            log(e.getMessage());
        }
        
        finally
        {
            closeConnection();
        }
        
        return foodList;
    } 
     
     public ArrayList<MenuDTO> populateMenuList(ArrayList<MenuDTO> menuList)
     {
        try
        {
            for(MenuDTO menu : menuList)
            {
                

                    for (String id : menu.getFoodIDs()) {
                        menu.getMenuFoodList().add(getFoodWithID(id));
                    }
                    
                    menu.setComboFoodList(getComboFoodWithID(menu.getComboIDs(), menu.getId()));
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            log(e.getMessage());
        }
        
        finally
        {
            closeConnection();
        }
        
        return menuList;
     }
     
     public MenuDTO populateSingleMenu(MenuDTO menu)
     {
        try
        {
            
            for(String id : menu.getFoodIDs())
                menu.getMenuFoodList().add(getFoodWithID(id));
            
            menu.setComboFoodList(getComboFoodWithID(menu.getComboIDs(), menu.getId()));
            
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
            log(e.getMessage());
        }
        
        finally
        {
            closeConnection();
        }
        
        return menu;
     }
     
     public HashSet<FoodDTO> getAllFoodsForDisplay()
     {
         FoodDTO foodDTO = null;
         HashSet<FoodDTO> result = new HashSet<>();
         try
         {
             String sql = "Select FoodID,FoodName,Price,isMainDisk,isMainDisk2,isSideDisk,isAvailable From tableFood";
             
             connection = ConnectionClass.getConnection();
             
             if(connection != null)
             {
                 preparedStatement = connection.prepareStatement(sql);
                 resultSet = preparedStatement.executeQuery();
                 
                 while(resultSet.next())
                 {
                     foodDTO = new FoodDTO();
                     foodDTO.setId(resultSet.getString("FoodID"));
                     foodDTO.setName(resultSet.getString("FoodName"));
                     foodDTO.setPrice(resultSet.getFloat("Price"));
                     foodDTO.setIsMain(resultSet.getBoolean("isMainDisk"));
                     foodDTO.setIsMain2(resultSet.getBoolean("isMainDisk2"));
                     foodDTO.setIsMain2(resultSet.getBoolean("isSideDisk"));
                     foodDTO.setIsMain2(resultSet.getBoolean("isAvailable"));
                     
                     result.add(foodDTO);
                 }
             }
             
             
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return result;
     }
     
     
     public String checkLogin(UserDTO user)
     {
         String role = null;
         try
         {
             String sql = "Select Username,UserPassword,Role From tableUser Where Username=? AND UserPassword=? AND Status=?";
             connection = ConnectionClass.getConnection();
             
             if(connection != null)
             {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, user.getUsername());
                preparedStatement.setString(2, user.getUserPassword());
                preparedStatement.setBoolean(3, true);

                resultSet = preparedStatement.executeQuery();
                
                if(resultSet.next())
                {
                    role = resultSet.getString("Role");
                }
                 
             }
             
             
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return role;
     }
     
     public boolean insertNewUser(UserDTO newUser)
     {
        boolean success = false;
        
         try
         {
             String sql = "Insert Into tableUser(UserID,UserFullName,Username,UserPassword,UserEmail,Role,DateOrdered,Status) VALUES (?,?,?,?,?,?,?,?)";
             String id = "U" + autoGeneratedIndex("UserID", "tableUser");
             connection = ConnectionClass.getConnection();
             
             if(connection != null)
             {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, id);
                preparedStatement.setString(2, newUser.getUserFullName());
                preparedStatement.setString(3, newUser.getUsername());
                preparedStatement.setString(4, newUser.getUserPassword());
                preparedStatement.setString(5, newUser.getUserEmail());
                preparedStatement.setString(6, newUser.getRole());
                preparedStatement.setDate(7, newUser.getDateOrder());
                preparedStatement.setBoolean(8, true);
                
                success = preparedStatement.executeUpdate() > 0;
                
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return success;
     }
     
     public MenuDTO getTodayMenu()
     {
        MenuDTO menu = null;
        try
        {
            connection = ConnectionClass.getConnection();
            
            if(connection != null)
            {
                
                java.util.Date utilDate = new java.util.Date();
                 java.sql.Date date = new java.sql.Date(utilDate.getTime());
                 GregorianCalendar calendar = new GregorianCalendar();
                 calendar.setTime(date);
                 int todayWeekDay =  calendar.get(calendar.DAY_OF_WEEK);
                 
                String connectionString = "SELECT ID,Name,Date,DayInWeek From tableMenu Where DayInWeek=?";
                

                
                preparedStatement = connection.prepareStatement(connectionString);
                preparedStatement.setInt(1, todayWeekDay);

                resultSet = preparedStatement.executeQuery();
                if(resultSet.next())
                {
                    menu = new MenuDTO();
                    menu.setId(resultSet.getString("ID"));
                    menu.setName(resultSet.getString("Name"));
                    menu.setDateCreated(resultSet.getDate("Date"));
                    menu.setDayInWeek(resultSet.getInt("DayInWeek"));
                }
                
                if(menu != null)
                {
                    connectionString = "Select FoodID,ComboID from FoodList Where MenuID=?";
                    preparedStatement = connection.prepareStatement(connectionString);
                    preparedStatement.setString(1, menu.getId());
                    resultSet = preparedStatement.executeQuery();

                    while (resultSet.next()) {
                        menu.getFoodIDs().add(resultSet.getString("FoodID"));
                        menu.getComboIDs().add(resultSet.getString("ComboID"));
                    }
                }
                
                else
                    System.err.println("Error at DAO, today menu was not found");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            log(e.getMessage());
        }
        
        finally
        {
            closeConnection();
        }
        
        return menu;
     }
     
     
     public MenuDTO getSingleMenu(String menuID)
     {
        MenuDTO menu = null;
        try
        {
            connection = ConnectionClass.getConnection();
            
            if(connection != null)
            {
                
                java.util.Date utilDate = new java.util.Date();
                 java.sql.Date date = new java.sql.Date(utilDate.getTime());
                 GregorianCalendar calendar = new GregorianCalendar();
                 calendar.setTime(date);
                 int todayWeekDay =  calendar.get(calendar.DAY_OF_WEEK);
                 
                String connectionString = "SELECT ID,Name,Date,DayInWeek From tableMenu Where ID=?";
                

                
                preparedStatement = connection.prepareStatement(connectionString);
                preparedStatement.setString(1, menuID);

                resultSet = preparedStatement.executeQuery();
                if(resultSet.next())
                {
                    menu = new MenuDTO();
                    menu.setId(resultSet.getString("ID"));
                    menu.setName(resultSet.getString("Name"));
                    menu.setDateCreated(resultSet.getDate("Date"));
                    menu.setDayInWeek(resultSet.getInt("DayInWeek"));
                }
                
                if(menu != null)
                {
                    connectionString = "Select FoodID,ComboID from FoodList Where MenuID=?";
                    preparedStatement = connection.prepareStatement(connectionString);
                    preparedStatement.setString(1, menu.getId());
                    resultSet = preparedStatement.executeQuery();

                    while (resultSet.next()) {
                        menu.getFoodIDs().add(resultSet.getString("FoodID"));
                        menu.getComboIDs().add(resultSet.getString("ComboID"));
                    }
                }
                
                else
                    System.err.println("Error at DAO, today menu was not found");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            log(e.getMessage());
        }
        
        finally
        {
            closeConnection();
        }
        
        return menu;
     }
     
     private int autoGeneratedIndex(String id, String table)
     {
         int result = 0;
         try
         {
             String sql = "Select COUNT("+id+") as Total From "+table;
             connection = ConnectionClass.getConnection();
             
             if(connection != null)
             {
                     preparedStatement = connection.prepareStatement(sql);
         
                 resultSet = preparedStatement.executeQuery();

                 if (resultSet.next()) {
                     result = resultSet.getInt("Total");
                 }

             }
        
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
         }
         
         finally
         {
             closeConnection();
         }
         
         return result + 1;
     }
     
     public boolean insertOrder(String customerID, String[] foodIds, String[] comboIds)
     {
          boolean success = false;
         try
         {
             String sql = "Insert Into tableOrder(OrderID,CustomerID,DateOrdered,Status) VALUES(?,?,?,?)";
             java.util.Date utilDate = new java.util.Date();
             java.sql.Date date = new java.sql.Date(utilDate.getTime());
             String orderID = "O"+autoGeneratedIndex("OrderID", "tableOrder");
             connection = ConnectionClass.getConnection();
             
             if(connection != null)
             {
                 preparedStatement = connection.prepareStatement(sql);
                 preparedStatement.setString(1, orderID);
                 preparedStatement.setString(2, customerID);
                 preparedStatement.setDate(3, date);
                 preparedStatement.setBoolean(4, true);

                 success = preparedStatement.executeUpdate() > 0;
                 
                 for(String comboID : comboIds)
                 {
                      String orderDetailID= "OD" + autoGeneratedIndex("OrderDetailID", "talbleOrderDetail");
                        connection = ConnectionClass.getConnection();

                     sql = "Insert Into talbleOrderDetail(OrderDetailID,OrderID,ComboID,FoodID) VALUES(?,?,?,?)";
                     preparedStatement = connection.prepareStatement(sql);
                     preparedStatement.setString(1, orderDetailID);
                     preparedStatement.setString(2, orderID);
                     preparedStatement.setString(3, comboID);
                     preparedStatement.setString(4, null);
                     
                     success = preparedStatement.executeUpdate() > 0;
                     closeConnection();
                 }
                 
                 for(String foodID : foodIds)
                 {
                     String orderDetailID= "OD" + autoGeneratedIndex("OrderDetailID", "talbleOrderDetail");
                    connection = ConnectionClass.getConnection();
                     sql = "Insert Into talbleOrderDetail(OrderDetailID,OrderID,ComboID,FoodID) VALUES(?,?,?,?)";
                     preparedStatement = connection.prepareStatement(sql);
                     preparedStatement.setString(1,orderDetailID);
                     preparedStatement.setString(2, orderID);
                     preparedStatement.setString(3, null);
                     preparedStatement.setString(4, foodID);
                     
                     success = preparedStatement.executeUpdate() > 0;
                    closeConnection();
                 }
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
         }
         
         finally
         {
             closeConnection();
         }
         
         return success;
     }
     
     public boolean checkOrderedInDay(String customerID)
     {
         boolean alreadyOrdered= false;
         try
         {
             String sql = "Select DateOrdered From tableOrder Where CustomerID=? order by DateOrdered desc";
             connection = ConnectionClass.getConnection();
             
             if(connection != null)
             {
                 preparedStatement = connection.prepareStatement(sql);
                 preparedStatement.setString(1, customerID);
                 resultSet = preparedStatement.executeQuery();
                 
                 if(resultSet.next())
                 {
                     Date getDate = resultSet.getDate("DateOrdered");
                     java.util.Date utilDate = new java.util.Date();
                     java.sql.Date date = new java.sql.Date(utilDate.getTime());
                     
                     if(DateUtils.isSameDay(getDate,date))
                         alreadyOrdered = true;
                 }

                 
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
         }
         
         finally
         {
             closeConnection();
         }
         
         return alreadyOrdered;
     }
  
     public boolean addNewItemToMenu(String menuID, String foodID, String comboID)
     {
         boolean success = false;
        
         try
         {
             String sql = "Insert Into FoodList(ListID,FoodID,MenuID,ComboID) Values(?,?,?,?)";
             String id = "L" + autoGeneratedIndex("ListID", "FoodList");
             connection = ConnectionClass.getConnection();

             if (connection != null) {
                 preparedStatement = connection.prepareStatement(sql);
                 preparedStatement.setString(1, id);
                 preparedStatement.setString(2, foodID);
                 preparedStatement.setString(3, menuID);
                 preparedStatement.setString(4, comboID);
                 
                 success = preparedStatement.executeUpdate() > 0;
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
         }
         
         finally
         {
             closeConnection();
         }
         
         return success;
     }
     
     public String addNewCombo(String comboName)
     {
         boolean success = false;
         String id = null;
         try
         {
             String sql = "Insert Into tableCombo(ComboID,ComboName) Values(?,?)";
             id = "C" + autoGeneratedIndex("ComboID", "tableCombo");
             connection = ConnectionClass.getConnection();

             if (connection != null) {
                 preparedStatement = connection.prepareStatement(sql);
                 preparedStatement.setString(1, id);
                 preparedStatement.setString(2, comboName);
                 
                 success = preparedStatement.executeUpdate() > 0;
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return id;
     }
     
     public boolean removeItemFromMenu(String itemToRemove, String menuID, String itemID)
     {
          boolean success = false;
            String sql = null;

         try
         {
             
             
             connection = ConnectionClass.getConnection();

             if (connection != null) 
             {
                 if (itemToRemove.equals("Food")) 
                 {
                     sql = "Delete From FoodList Where MenuID=? AND FoodID=?";
                     
                     preparedStatement = connection.prepareStatement(sql);
                     preparedStatement.setString(1, menuID);
                     preparedStatement.setString(2, itemID);

                     success = preparedStatement.executeUpdate() > 0;
                     
                     sql = "Update tableFood Set isAvailable=? Where FoodID=?";
                     
                     preparedStatement = connection.prepareStatement(sql);
                     preparedStatement.setBoolean(1, false);
                     preparedStatement.setString(2, itemID);

                     success = preparedStatement.executeUpdate() > 0;

                 } else if (itemToRemove.equals("Combo")) {
                     sql = "Delete From FoodList Where MenuID=? AND ComboID=?";
                       
                     preparedStatement = connection.prepareStatement(sql);
                     preparedStatement.setString(1, menuID);
                     preparedStatement.setString(2, itemID);
                     
                    success = preparedStatement.executeUpdate() > 0;

                 }
                 
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return success;
     }
     
     public boolean updateFood(FoodDTO foodDTO)
     {
         boolean success = false;

         try
         {
            String sql = "Update tableFood Set FoodName=?,Price=?,ImageLink=?,isMainDisk=?,isMainDisk2=?,"
                 + "isSideDisk=?,isAvailable=? Where FoodID=?";
            
            connection = ConnectionClass.getConnection();
            
            if(connection != null)
            {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, foodDTO.getName());
                preparedStatement.setFloat(2, foodDTO.getPrice());
                preparedStatement.setString(3, foodDTO.getImageLink());
                preparedStatement.setBoolean(4, foodDTO.isIsMain());
                preparedStatement.setBoolean(5, foodDTO.isIsMain2());
                preparedStatement.setBoolean(6, foodDTO.isIsSide());
                preparedStatement.setBoolean(7, foodDTO.isIsAvailable());
                preparedStatement.setString(8, foodDTO.getId());

                success = preparedStatement.executeUpdate() > 0;
            }

          
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
         }
         
         finally
         {
             closeConnection();
         }
         
         return success;
     }
     
     public String insertNewFood(FoodDTO foodDTO)
     {
         boolean success = false;
          String id = null;
         try
         {
             id = "F"+ autoGeneratedIndex("FoodID", "tableFood");
            String sql = "Insert Into tableFood(FoodID,FoodName,Price,ImageLink,isMainDisk,isMainDisk2,isSideDisk,isAvailable) "
                    + "VALUES(?,?,?,?,?,?,?,?)";
            connection = ConnectionClass.getConnection();
            if(connection != null)
            {
                 preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, id);
                preparedStatement.setString(2, foodDTO.getName());
                preparedStatement.setFloat(3, foodDTO.getPrice());
                preparedStatement.setString(4, foodDTO.getImageLink());
                preparedStatement.setBoolean(5, foodDTO.isIsMain());
                preparedStatement.setBoolean(6, foodDTO.isIsMain2());
                preparedStatement.setBoolean(7, foodDTO.isIsSide());
                preparedStatement.setBoolean(8, foodDTO.isIsAvailable());

                success = preparedStatement.executeUpdate() > 0;
                
            }
           
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return id;
     }
     
     public boolean updateUserDetail(UserDTO userDTO)
     {
         boolean success = false;
         try
         {
             String sql = "Update tableUser Set UserFullName=?,Username=?,UserPassword=?,UserEmail=?,Role=?,"
                     + "DateOrdered=? Where UserID=?";
             connection = ConnectionClass.getConnection();
             
             if(connection != null)
             {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, userDTO.getUserFullName());
                preparedStatement.setString(2, userDTO.getUsername());
                preparedStatement.setString(3, userDTO.getUserPassword());
                preparedStatement.setString(4, userDTO.getUserEmail());
                preparedStatement.setString(5, userDTO.getUserOrder());
                preparedStatement.setString(6, userDTO.getUserComboOrder());
                preparedStatement.setString(7, userDTO.getRole());
                preparedStatement.setDate(8, userDTO.getDateOrder());
                preparedStatement.setString(9, userDTO.getUserID());

                
                success = preparedStatement.executeUpdate() > 0;
                
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return success;
     }
     
     public boolean removeUser(String userID)
     {
         boolean success = false;
         try
         {
             String sql = "Update tableUser Set Status=? Where UserID=?";
             connection = ConnectionClass.getConnection();
             
             if(connection != null)
             {
               preparedStatement = connection.prepareStatement(sql);
               preparedStatement.setBoolean(1, false);
                preparedStatement.setString(2, userID);
                
                success = preparedStatement.executeUpdate() > 0;
                
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return success;
     }
     
     public ArrayList<OrderDTO> getOrders(String customerID)
     {
         OrderDTO orderDTO = null;
         ArrayList<OrderDTO> orderList = new ArrayList<>();
         ArrayList<String> tempFoodListID = new ArrayList<>();
         String sql = "Select OrderID,CustomerID,DateOrdered,Price From tableOrder Where Status=? AND CustomerID=?";
         try
         {
            connection = ConnectionClass.getConnection();

             if(connection != null)
             {
                 preparedStatement =connection.prepareStatement(sql);
                 preparedStatement.setBoolean(1, true);
                 preparedStatement.setString(2, customerID);

                 resultSet = preparedStatement.executeQuery();
                 
                 while(resultSet.next())
                 {
                     orderDTO = new OrderDTO();
                     orderDTO.setOrderID(resultSet.getString("OrderID"));
                     orderDTO.setCustomerID(resultSet.getString("CustomerID"));
                     orderDTO.setDateOrdered(resultSet.getDate("DateOrdered"));
                     orderDTO.setPrice(resultSet.getFloat("Price"));
                     orderList.add(orderDTO);
                 }
                 
                  for (OrderDTO order : orderList) {
                     sql = "Select ComboID,FoodID From talbleOrderDetail Where OrderID=?";
                     preparedStatement = connection.prepareStatement(sql);
                     preparedStatement.setString(1,order.getOrderID());
                     resultSet = preparedStatement.executeQuery();

                     while (resultSet.next()) {
                             if (resultSet.getString("ComboID") != null) {
                                 order.getComboLists().put(resultSet.getString("ComboID"), null);
                             }

                             if (resultSet.getString("FoodID") != null) 
                             {
                                 tempFoodListID.add(resultSet.getString("FoodID"));
                               
                             }
                     }
                     
                       for(String foodID : tempFoodListID)
                        order.getFoodLists().add(getFoodWithID(foodID));
                       
                    connection = ConnectionClass.getConnection();
                    
                    if(connection != null)
                    {
                        //populate combo list
                        for (String comboID : order.getComboLists().keySet()) {
                            HashSet<FoodDTO> tempFoodList = new HashSet<>();
                            FoodDTO foodDTO = null;
                            sql = "Select FoodID From FoodList Where ComboID=?";
                            preparedStatement = connection.prepareStatement(sql);
                            preparedStatement.setString(1, comboID.trim());

                            resultSet = preparedStatement.executeQuery();

                            while (resultSet.next()) {
                                foodDTO = getFoodWithID(resultSet.getString("FoodID"));
                                tempFoodList.add(foodDTO);

                            }

                            order.getComboLists().replace(comboID, tempFoodList);
                        }
                    }
                  }
                 
                 
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         return orderList;
     }
     
     public UserDTO getUserInfo(String username)
     {
         UserDTO userDTO = null;
         try
         {
             String sql = "Select UserID,UserFullName,Username,UserPassword,UserEmail,Role,DateOrdered"
                     + " From tableUser Where Username=?";
             connection = ConnectionClass.getConnection();
             
             if(connection != null)
             {
                 preparedStatement = connection.prepareStatement(sql);
                 preparedStatement.setString(1, username);
                 resultSet = preparedStatement.executeQuery();
                 
                 if(resultSet.next())
                 {
                    userDTO = new UserDTO();
                    userDTO.setUserID(resultSet.getString("UserID"));
                    userDTO.setUserFullName(resultSet.getString("UserFullName"));
                    userDTO.setUsername(resultSet.getString("Username"));
                    userDTO.setUserPassword(resultSet.getString("UserPassword"));
                    userDTO.setUserEmail(resultSet.getString("UserEmail"));
                    userDTO.setRole(resultSet.getString("Role"));
                    userDTO.setDateOrder(resultSet.getDate("DateOrdered"));
                 }

                 
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return userDTO;
     }
     
     public HashSet<UserDTO> getAllUsers()
     {
         HashSet<UserDTO> result = new HashSet<>();
         UserDTO userDTO = null;
         try
         {
             String sql = "Select UserID,UserFullName,Username,UserPassword,UserEmail,Role,DateOrdered,Status from tableUser Where Status=?";
             connection = ConnectionClass.getConnection();
             if(connection != null)
             {
                 preparedStatement = connection.prepareStatement(sql);
                 preparedStatement.setBoolean(1, true);

                 
                 resultSet = preparedStatement.executeQuery();
                 
                 while(resultSet.next())
                 {
                     userDTO = new UserDTO();
                     userDTO.setUserID(resultSet.getString("UserID"));
                     userDTO.setUserFullName(resultSet.getString("UserFullName"));
                     userDTO.setUsername(resultSet.getString("Username"));
                     userDTO.setUserPassword(resultSet.getString("UserPassword"));
                     userDTO.setUserEmail(resultSet.getString("UserEmail"));
                     userDTO.setRole(resultSet.getString("Role"));
                     userDTO.setDateOrder(resultSet.getDate("DateOrdered"));

                     result.add(userDTO);
                 }
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return result;
     }
     
     public boolean checkDuplicatedUsername(String username)
     {
         String sql = "Select Username from tableUser Where Username=?";
         boolean success = false;
         try
         {
            connection = ConnectionClass.getConnection();
            if(connection != null)
            {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, username);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next())
                    success = true;
            }

         }
         
         catch(Exception e)
         {
             e.printStackTrace();
             log(e.getMessage());
         }
         
         finally
         {
             closeConnection();
         }
         
         return success;
             
     }
     
     public float setComboPrice(HashSet<FoodDTO> foodsInCombo, String comboID)
     {
         float result = -1;
         boolean success = false;
         try
         {
             for(FoodDTO foodDTO : foodsInCombo)
                 result += foodDTO.getPrice();
             
             String sql = "Update tableCombo Set ComboPrice=? Where ComboID=?";
             connection = ConnectionClass.getConnection();
             if(connection != null)
             {
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setFloat(1, result);
                    preparedStatement.setString(2, comboID);
                    success = preparedStatement.executeUpdate() > 0;
             }
             
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
            log(e.getMessage());

         }
         
         finally
         {
             closeConnection();
         }
         
         return result;
     }
     
     public float getComboPrice(String comboID)
     {
         float result = -1;
         try
         {
             String sql = "Select ComboPrice From tableCombo Where ComboID=?";
             connection = ConnectionClass.getConnection();
             if(connection != null)
             {
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, comboID);
                    resultSet = preparedStatement.executeQuery();
                    
                    if(resultSet.next())
                        result = resultSet.getFloat("ComboPrice");
             }
             
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
            log(e.getMessage());

         }
         
         finally
         {
             closeConnection();
         }
         
         return result;
     }
     
     public ArrayList<OrderDTO> getOrderBySearch(String customerID, String searchPattern)
     {
         OrderDTO orderDTO = null;
         ArrayList<OrderDTO> orderList = new ArrayList<>();
         ArrayList<String> tempFoodListID = new ArrayList<>();
         String sql = "Select OrderID,CustomerID,DateOrdered,Price From tableOrder Where Status=? AND CustomerID=? AND (DateOrdered LIKE ? OR OrderID LIKE ?)";
         try
         {
            connection = ConnectionClass.getConnection();

             if(connection != null)
             {
                 preparedStatement =connection.prepareStatement(sql);
                 preparedStatement.setBoolean(1, true);
                 preparedStatement.setString(2, customerID);
                preparedStatement.setString(3, "%"+searchPattern+"%");
                 preparedStatement.setString(4, "%"+searchPattern+"%");


                 resultSet = preparedStatement.executeQuery();
                 
                 while(resultSet.next())
                 {
                     orderDTO = new OrderDTO();
                     orderDTO.setOrderID(resultSet.getString("OrderID"));
                     orderDTO.setCustomerID(resultSet.getString("CustomerID"));
                     orderDTO.setDateOrdered(resultSet.getDate("DateOrdered"));
                     orderDTO.setPrice(resultSet.getFloat("Price"));
                     orderList.add(orderDTO);
                 }
                 
                  for (OrderDTO order : orderList) {
                     sql = "Select ComboID,FoodID From talbleOrderDetail Where OrderID=?";
                     preparedStatement = connection.prepareStatement(sql);
                     preparedStatement.setString(1,order.getOrderID());
                     resultSet = preparedStatement.executeQuery();

                     while (resultSet.next()) {
                             if (resultSet.getString("ComboID") != null) {
                                 order.getComboLists().put(resultSet.getString("ComboID"), null);
                             }

                             if (resultSet.getString("FoodID") != null) 
                             {
                                 tempFoodListID.add(resultSet.getString("FoodID"));
                               
                             }
                     }
                     
                       for(String foodID : tempFoodListID)
                        order.getFoodLists().add(getFoodWithID(foodID));
                       
                    connection = ConnectionClass.getConnection();
                    
                    if(connection != null)
                    {
                        //populate combo list
                        for (String comboID : order.getComboLists().keySet()) {
                            HashSet<FoodDTO> tempFoodList = new HashSet<>();
                            FoodDTO foodDTO = null;
                            sql = "Select FoodID From FoodList Where ComboID=?";
                            preparedStatement = connection.prepareStatement(sql);
                            preparedStatement.setString(1, comboID.trim());

                            resultSet = preparedStatement.executeQuery();

                            while (resultSet.next()) {
                                foodDTO = getFoodWithID(resultSet.getString("FoodID"));
                                tempFoodList.add(foodDTO);

                            }

                            order.getComboLists().replace(comboID, tempFoodList);
                        }
                    }
                  }
                 
                 
             }
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
            log(e.getMessage());

         }
         
         finally
         {
             closeConnection();
         }
         return orderList;
     }
     
     public boolean enableFood(String foodID)
     {
        boolean success = false;
         try
         {
             String sql = "Update tableFood Set isAvailable=? Where FoodID=?";
             connection = ConnectionClass.getConnection();
             if(connection != null)
             {
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setBoolean(1, true);
                    preparedStatement.setString(2, foodID);

                    
                    success = preparedStatement.executeUpdate() > 0;
             }
             
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
            log(e.getMessage());

         }
         
         finally
         {
             closeConnection();
         }
         
         return success;
     }
}
