/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard;

import dao.FeedbackDAO;
import dao.SlidersDAO;
import jakarta.servlet.RequestDispatcher;
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
@WebServlet(name = "DetailSilderController", urlPatterns = {"/sliderDetail"})
public class DetailSilderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            int id = 0;
            try {
                id = Integer.parseInt(idStr);
            } catch (NumberFormatException e) {
                response.sendRedirect("errorPage.jsp");
                return;
            }

            SlidersDAO dao = new SlidersDAO();
            Slider slider = dao.getSliderById(id);

            if (slider != null) {
                request.setAttribute("slider", slider);
                request.getRequestDispatcher("viewsAdmin/sliderDetail.jsp").forward(request, response);
            } else {
                response.sendRedirect("notFound.jsp");
            }
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
