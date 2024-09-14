/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import dao.ProductDAO;
import java.util.Date;

/**
 *
 * @author PC
 */
public class Orders {
    private String id;
    private String customer_id;
    private String product_id;
    private String size;
    private int quantity;
    private String title;
    private int price;
    private String status;
    private String date;
    private String note;
    private int numberProduct;
    private int totalPrice;
    

    public Orders() {
    }

    public Orders(String customer_id, String product_id, String size, int quantity) {
        this.customer_id = customer_id;
        this.product_id = product_id;
        this.size = size;
        this.quantity = quantity;
    }

    public Orders(String id, String customer_id, String product_id, String size, int quantity, String status, String date, String note) {
        this.id = id;
        this.customer_id = customer_id;
        this.product_id = product_id;
        this.size = size;
        this.quantity = quantity;
        this.status = status;
        this.date = date;
        this.note = note;
    }

    public Orders(String id, String customer_id, String product_id, String size, int quantity, int price, String status, String date, String note) {
        this.id = id;
        this.customer_id = customer_id;
        this.product_id = product_id;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
        this.date = date;
        this.note = note;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getPrice() {
        ProductDAO pdao = new ProductDAO();
        Product p = pdao.getProductIByID(this.getProduct_id());
        int shipPrice = 30000;
        return ((p.getPrice() - (p.getPrice()*p.getSalePercent()/100)) * this.getQuantity()) + shipPrice;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTitle() {
        ProductDAO pdao = new ProductDAO();
        Product p = pdao.getProductIByID(this.getProduct_id());
        return p.getTitle();
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getNumberProduct() {
        return numberProduct;
    }

    public void setNumberProduct(int numberProduct) {
        this.numberProduct = numberProduct;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    
}
