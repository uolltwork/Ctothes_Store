/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.CustomerDAO;
import dao.OrdersDAO;
import entity.Account;
import entity.Customer;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author PC
 */
@WebServlet(name = "LoadCustomerInfo", urlPatterns = {"/loadCustomerInfo"})
public class LoadCustomerInfo extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("accountSeesion");

        CustomerDAO cdao = new CustomerDAO();
        Customer cus = cdao.getCustomerByAccountID(acc.getID());

        OrdersDAO odao = new OrdersDAO();
        List<Orders> listOrdersOfCus = odao.getListOrdersOfCustomer(String.valueOf(cus.getID()));

        int totalPrice = 0;
        for (int i = 0; i <= listOrdersOfCus.size() - 2; i++) {
            int numberProduct = 1;
            for ( int j = i + 1; j < listOrdersOfCus.size(); j++) {
                if (listOrdersOfCus.get(i).getId().equals(listOrdersOfCus.get(j).getId())) {
                    totalPrice += listOrdersOfCus.get(j).getPrice();
                    listOrdersOfCus.get(i).setTotalPrice( listOrdersOfCus.get(i).getPrice() + totalPrice);
                    listOrdersOfCus.remove(j);
                    j--;
                    numberProduct++;
                }
            }
            totalPrice = 0;
            if(listOrdersOfCus.get(i).getTotalPrice() == 0) {
                listOrdersOfCus.get(i).setTotalPrice(listOrdersOfCus.get(i).getPrice());
            }
            listOrdersOfCus.get(i).setNumberProduct(numberProduct);
        }

        int orderQuantityOfCustomer = odao.getOrderQuantity(listOrdersOfCus);
        request.setAttribute("listOrderOfCustomer", listOrdersOfCus);
        request.setAttribute("listOrderOfCustomerSize", orderQuantityOfCustomer);
        request.setAttribute("customerInfo", cus);
        request.getRequestDispatcher("CustomerInfo.jsp").forward(request, response);
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
