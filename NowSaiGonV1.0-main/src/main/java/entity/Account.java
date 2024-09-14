/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class Account {
    private int ID;
    private String phone;
    private String password;
    private int roleID;
    
    public Account() {
    }

    public Account(int ID, String phone, String password, int roleID) {
        this.ID = ID;
        this.phone = phone;
        this.password = password;
        this.roleID = roleID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    @Override
    public String toString() {
        return "Account{" + "ID=" + ID + ", phone=" + phone + ", password=" + password + ", roleID=" + roleID + '}';
    }
}
