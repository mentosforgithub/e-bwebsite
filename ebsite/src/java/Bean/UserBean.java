/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.io.Serializable;

/**
 *
 * @author hment
 */
public class UserBean extends Object implements Serializable{
    private int bid;
    private String username;
    
    public UserBean(){
        bid = 0;
        username="";
    }
    public void setBid(int bid){
        this.bid = bid;
    }
    public void setUsername(String username){
        this.username = username;
    }
    public int getBid(){
        return this.bid;
    }
    public String getUsername(){
        return this.username;
    }
}
