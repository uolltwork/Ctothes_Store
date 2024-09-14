/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.CartDAO;
import dao.CustomerDAO;
import dao.OrdersDAO;
import dao.ProductDAO;
import entity.Customer;
import entity.Orders;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author PC
 */
@WebServlet(name = "OrderHandler", urlPatterns = {"/orderLoad"})
public class OrderLoad extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String cartID[] = request.getParameterValues("isPayed");

        int pID = 0;
        int cID = 0;
        int quantity = 0;
        int productPrice = 0;
        
        String size, productTitle, productImg;

        List<Orders> listOrders = new ArrayList<>();
        List<Product> listProducts = new ArrayList<>();

        OrdersDAO odao = new OrdersDAO();
        CartDAO cdao = new CartDAO();

        ProductDAO pdao = new ProductDAO();

        CustomerDAO cusdao = new CustomerDAO();

        for (int i = 0; i < cartID.length; i++) {
            String isCheckedTxt = cartID[i];
            pID = cdao.sliptProductIDByCartID(isCheckedTxt);
            cID = cdao.sliptCusIDByCartID(isCheckedTxt);
            size = cdao.sliptSizeByCartID(isCheckedTxt);
            quantity = cdao.getQuantity(pID, cID, size);

            Product p = pdao.getProductIByID(String.valueOf(pID));

            listProducts.add(p);
            listOrders.add(new Orders(String.valueOf(cID), String.valueOf(pID), size, quantity));
        }
        
        int tempPrice = 0;
        for (Product listProduct : listProducts) {
            for (Orders listOrder : listOrders) {
                if(listProduct.getID() == Integer.parseInt(listOrder.getProduct_id())) {
                    tempPrice += (listOrder.getQuantity() * listProduct.getPrice());
                }
            }
        }

        HttpSession seesion = request.getSession();
        seesion.setAttribute("listOrderSesion", listOrders);
        
        Customer c = cusdao.getCustomerByID(cID);
        request.setAttribute("customer", c);
        request.setAttribute("listProducts", listProducts);
        request.setAttribute("listOrderProducts", listOrders);
        request.setAttribute("tempPrice", tempPrice);
        request.setAttribute("totalPrice", tempPrice + 30000);
        
        seesion.setMaxInactiveInterval(86400);
        request.getRequestDispatcher("Paying.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
