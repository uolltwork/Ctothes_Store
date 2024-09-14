/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import dao.AccountDAO;

/**
 *
 * @author PC
 */
public class Customer {
    private int ID;
    private String name;
    private String email;
    private String address;
    private int accountID;
    private String phone;

    public Customer() {
    }

    public Customer(int ID, String name, String email, String address, int accountID) {
        this.ID = ID;
        this.name = name;
        this.email = email;
        this.address = address;
        this.accountID = accountID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getPhone() {
        AccountDAO adao = new AccountDAO();
        Account c = adao.getAccountByAccountID(String.valueOf(this.getAccountID()));
        return c.getPhone();
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
