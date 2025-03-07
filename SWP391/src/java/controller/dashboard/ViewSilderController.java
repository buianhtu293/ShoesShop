/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard;

import dao.FeedbackDAO;
import dao.SlidersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Pagination;
import model.Ratting;
import model.Slider;

/**
 *
 * @author 84355
 */
@WebServlet(name = "ViewSilderController", urlPatterns = {"/sliderList"})
public class ViewSilderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String status = request.getParameter("status");
            String search = request.getParameter("search");
            String pageStr = request.getParameter("currentPage");
            int page = 1;
            int pageSize = 5; // Define the number of records per page

            if (pageStr != null) {
                try {
                    page = Integer.parseInt(pageStr);
                } catch (NumberFormatException e) {
                    page = 1;
                }
            }

            SlidersDAO slidersDAO = new SlidersDAO();
            List<Slider> sliders = slidersDAO.getSliders(status, search, page, pageSize);
            int totalSliders = slidersDAO.countSliders(status, search);

            int noOfPages = (int) Math.ceil(totalSliders * 1.0 / pageSize);

            request.setAttribute("sliders", sliders);
            request.setAttribute("status", status);
            request.setAttribute("search", search);
            request.setAttribute("cp", page);
            request.setAttribute("totalPage", noOfPages);

            request.getRequestDispatcher("viewsAdmin/viewSilder.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sliderId = Integer.parseInt(request.getParameter("id"));
        String newStatus = request.getParameter("status");

        SlidersDAO slidersDAO = new SlidersDAO();
        boolean isSuccess = slidersDAO.updateSliderStatus(sliderId, newStatus);

        if (isSuccess) {
            request.getSession().setAttribute("messSuccess", "Status updated successfully!");
        } else {
            request.getSession().setAttribute("messError", "Failed to update status.");
        }
        response.sendRedirect("sliderList");
    }
}
