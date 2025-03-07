package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dao.ProductDAO;
import dao.SlidersDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

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

        if (request.getParameter("service") == null) {
            view(request, response);
        } else {
            switch (request.getParameter("service")) {
                case "view" ->
                    view(request, response);
                case "addCartByAjax" ->
                    addCartByAjax(request, response);
                case "addCart" ->
                    addCart(request, response);
                default ->
                    response.sendRedirect("404.html");
            }
        }
    }

    /**
     *
     * @param request
     * @param response
     */
    public void addCart(HttpServletRequest request, HttpServletResponse response) {
        try {
            ProductDAO productDAO = new ProductDAO();
            SlidersDAO daoSlider = new SlidersDAO();
            SubProductServlet productServlet = new SubProductServlet();
            productServlet.dataForSider(request, response);
            request.setAttribute("product",
                    productDAO.searchUniqueName(
                            request.getParameter("name")).get(0));
            request.setAttribute("slider", daoSlider.getRadom());
            RequestDispatcher dispatch = request.getRequestDispatcher("product?service=detail&name=" + request.getParameter("name"));
            dispatch.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(SubProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param request
     * @param response
     */
    public void addCartByAjax(HttpServletRequest request, HttpServletResponse response) {
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            out.print("hello" + name + color + size);

        } catch (IOException ex) {
            Logger.getLogger(SubProductServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void view(HttpServletRequest request, HttpServletResponse response) {

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
