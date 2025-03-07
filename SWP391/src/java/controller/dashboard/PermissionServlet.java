/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard;

import dao.PermissionDAO;
import dao.RoleDAO;
import dao.UrlDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Roles;
import model.Url;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PermissionServlet", urlPatterns = {"/permissions"})
public class PermissionServlet extends HttpServlet {

    private PermissionDAO permissionDAO;
    private UrlDAO urlDAO;
    private RoleDAO roleDAO;

    public void init() {
        permissionDAO = new PermissionDAO();
        urlDAO = new UrlDAO();
        roleDAO = new RoleDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "view";
        }
        switch (action) {
            case "view":
                viewPermissions(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                viewPermissions(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "view";
        }
        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            default:
                doGet(request, response);
                break;
        }
    }

    private void viewPermissions(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Roles> roles = roleDAO.getAllRoles();
        request.setAttribute("roles", roles);
        String selectedRoleId = request.getParameter("roleId");

        if (selectedRoleId != null && !selectedRoleId.isEmpty()) {
            int roleId = Integer.parseInt(selectedRoleId);
            List<Url> urls = permissionDAO.selectUrlsByRole(roleId);
            request.setAttribute("urls", urls);
            request.setAttribute("selectedRoleId", roleId);
        }
        request.setAttribute("listUrl", urlDAO.getAllUrls());
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewsAdmin/viewPermission.jsp");
        dispatcher.forward(request, response);
    }

    private void updatePermissions(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        String[] urlIds = request.getParameterValues("urlIds");
        permissionDAO.deletePermissionsByRole(roleId); // First, clear existing permissions
        if (urlIds != null) {
            for (String urlId : urlIds) {
                permissionDAO.insertPermission(roleId, Integer.parseInt(urlId), "");
            }
        }
        response.sendRedirect("permissions?action=view&roleId=" + roleId);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            int urlId = Integer.parseInt(request.getParameter("urlId"));
            permissionDAO.delete(roleId, urlId);
            response.sendRedirect("permissions");

        } catch (Exception e) {
            request.setAttribute("errorCode", 400);
            request.setAttribute("errorMessage", e.getMessage());
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            String[] urlId_raw = request.getParameterValues("urlId");
            if (urlId_raw != null) {
                for (String url : urlId_raw) {
                    int urlId = Integer.parseInt(url);
                    permissionDAO.insertPermission(roleId, urlId, "Add Role: " + roleId);
                }
            }
            response.sendRedirect("permissions");
        } catch (Exception e) {
            request.setAttribute("errorCode", 400);
            request.setAttribute("errorMessage", e.getMessage());
        }
    }
}
