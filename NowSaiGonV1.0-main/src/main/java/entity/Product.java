/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class Product {

    private int ID;
    private String title;
    private int importPrice;
    private int price;
    private int salePercent;
    private String decript;
    private int quantity;
    private int sizeS;
    private int sizeM;
    private int sizeL;
    private int sizeXL;
    private int categoryID;

    public Product() {
    }

    public Product(int ID, String title, int importPrice, int price, int salePercent, String decript, int quantity, int sizeS, int sizeM, int sizeL, int sizeXL, int categoryID) {
        this.ID = ID;
        this.title = title;
        this.importPrice = importPrice;
        this.price = price;
        this.salePercent = salePercent;
        this.decript = decript;
        this.quantity = quantity;
        this.sizeS = sizeS;
        this.sizeM = sizeM;
        this.sizeL = sizeL;
        this.sizeXL = sizeXL;
        this.categoryID = categoryID;
    }

    public int getSizeS() {
        return sizeS;
    }

    public void setSizeS(int sizeS) {
        this.sizeS = sizeS;
    }

    public int getSizeM() {
        return sizeM;
    }

    public void setSizeM(int sizeM) {
        this.sizeM = sizeM;
    }

    public int getSizeL() {
        return sizeL;
    }

    public void setSizeL(int sizeL) {
        this.sizeL = sizeL;
    }

    public int getSizeXL() {
        return sizeXL;
    }

    public void setSizeXL(int sizeXL) {
        this.sizeXL = sizeXL;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getImportPrice() {
        return importPrice;
    }

    public void setImportPrice(int importPrice) {
        this.importPrice = importPrice;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSalePercent() {
        return salePercent;
    }

    public void setSalePercent(int salePercent) {
        this.salePercent = salePercent;
    }

    public String getDecript() {
        return decript;
    }

    public void setDecript(String decript) {
        this.decript = decript;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quality) {
        this.quantity = quality;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
}
