/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author NghiaHHCE160343@fpt.edu.vn
 */
public class Order {
    private String customer_id;
    private String product_id;
    private String size;
    private int quantity;

    public Order() {
    }

    public Order(String customer_id, String product_id, String size, int quantity) {
        this.customer_id = customer_id;
        this.product_id = product_id;
        this.size = size;
        this.quantity = quantity;
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

    
    
    
}
