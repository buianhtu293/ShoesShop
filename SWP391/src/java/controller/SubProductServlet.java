/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SlidersDAO;
import dao.*;
import dto.DTOProducts;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Slider;

/**
 *
 * @author Nhat Anh
 */
@WebServlet(name = "SubProductServlet", urlPatterns = {"/product"})
public class SubProductServlet extends HttpServlet {

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
        if(request.getParameter("service")==null){
            view(request, response);
        }
        else{
            switch (request.getParameter("service")) {
                case "detail" -> detail(request, response);
                case "view" -> view(request, response);
                case "addCartByAjax" -> addCartByAjax(request, response);
                case "addCart" -> addCart(request, response);
                case "searchName" -> searchName(request, response);
                default -> view(request, response);
            }
        }
    }
    
    /**
     * 
     * @param request
     * @param response 
     */
    public void addCart(HttpServletRequest request, HttpServletResponse response){
        try {
            DTOProducts dtoProducts = new DTOProducts();
            SlidersDAO daoSlider = new SlidersDAO();
            dataForSider(request, response);
            request.setAttribute("product",
                    dtoProducts.searchName(
                            request.getParameter("name")).get(0) );
            List<Slider> ls = daoSlider.getAll();
            Slider slider = ls.get((int)(Math.random()*ls.size()+1));
            request.setAttribute("slider", slider);
            request.setAttribute("relateProduct",
                    dtoProducts.getRalateProduct(
                            request.getParameter("brand"), 6));
            
            
            RequestDispatcher dispatch = request.getRequestDispatcher("product_detail.jsp");
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
    public void addCartByAjax(HttpServletRequest request, HttpServletResponse response){
        try {
            DTOProducts dtoProducts = new DTOProducts();
            request.setAttribute("message", "Hello");
            request.setAttribute("newProduct", 
                    dtoProducts.getProductLatest("new", 2));
            
            
            //Needs to reponse ajax
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"status\":\"success\"}");
        } catch (IOException ex) {
            Logger.getLogger(SubProductServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * 
     *  @param request servlet request
     * @param response servlet response
     */
    public void view(HttpServletRequest request, HttpServletResponse response){
        try {
            DTOProducts dtoProducts = new DTOProducts();
            SlidersDAO daoSlider = new SlidersDAO();
            dataForSider(request, response);
            List<Slider> ls = daoSlider.getAll();
            Slider slider = ls.get((int)(Math.random()*ls.size()+1));
            request.setAttribute("slider", slider);
            request.setAttribute("relateProduct",  
                            dtoProducts.getRalateProduct(
                                    request.getParameter("brand"), 6)); 
            RequestDispatcher dispatch = request.getRequestDispatcher("product_list.jsp");
            dispatch.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(SubProductServlet.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Use take information of product for selected product from wed
     * 
     * @param request servlet request
     * @param response servlet response
     */
    public void detail(HttpServletRequest request, HttpServletResponse response){
        try {
            DTOProducts dtoProducts = new DTOProducts();
            SlidersDAO daoSlider = new SlidersDAO();
            dataForSider(request, response);            
            // Because product in database have same name so just select element
            // index 0 of list
            request.setAttribute("product",
                    dtoProducts.searchName(
                            request.getParameter("name")).get(0) );
            //Set random slider for wed page direct
            List<Slider> ls = daoSlider.getAll();
            Slider slider = ls.get((int)(Math.random()*ls.size()+1));
            request.setAttribute("slider", slider);
            request.setAttribute("relateProduct",  
                            dtoProducts.getRalateProduct(
                                    request.getParameter("brand"), 6));
            RequestDispatcher dispatch = request.getRequestDispatcher("product_detail.jsp");
            dispatch.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(SubProductServlet.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Use to set data for sider of wed
     * 
     *  @param request servlet request
     * @param response servlet response
     */
    public void dataForSider(HttpServletRequest request, HttpServletResponse response){
            DTOProducts dtoProducts = new DTOProducts();
            ProductDAO dAOProducts = new ProductDAO();
            BrandDAO dAOBrands = new BrandDAO();
            CategoryDAO dAOCategories =new CategoryDAO();
            request.setAttribute("colorSider",dAOProducts.getAllColor().toArray() );
            request.setAttribute("brandSider", dAOBrands.getAllByStatus());
            request.setAttribute("categorySider", dAOCategories.getAllByStatus());
            request.setAttribute("newProductSider", 
                    dtoProducts.getProductLatest("new", 3));          
    }
    
    /**
     * 
     * 
     *  @param request servlet request
     * @param response servlet response
     */
    public void searchName(HttpServletRequest request, HttpServletResponse response){
        try {
            DTOProducts dtoProducts = new DTOProducts();
            ProductDAO dAOProducts = new ProductDAO();
            BrandDAO dAOBrands = new BrandDAO();
            CategoryDAO dAOCategories =new CategoryDAO();
            request.setAttribute("colors",dAOProducts.getAllColor().toArray() );
            request.setAttribute("brands", dAOBrands.getAllByStatus());
            request.setAttribute("categories", dAOCategories.getAllByStatus());
            RequestDispatcher dispatch = request.getRequestDispatcher("product_list.jsp");
            dispatch.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(SubProductServlet.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
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
