/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard;

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
import model.Url;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UrlServlet", urlPatterns = {"/url"})
public class UrlServlet extends HttpServlet {

    private UrlDAO urlDAO;
    private final int LIMIT_PAGE = 10;

    public void init() {
        urlDAO = new UrlDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUrl(request, response);
                break;
            case "search":
            case "list":
            default:
                listUrl(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "insert":
                insertUrl(request, response);
                break;
            case "update":
                updateUrl(request, response);
                break;
            default:
                doGet(request, response);
                break;
        }
    }

    private void listUrl(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        if (searchQuery == null) {
            searchQuery = "";
        }
        String pageStr = request.getParameter("page");
        int page = pageStr != null ? Integer.parseInt(pageStr) : 1;
        List<Url> listUrl = urlDAO.selectUrls(page, LIMIT_PAGE, searchQuery);
        int totalRows = urlDAO.countUrls(searchQuery);
        int totalPages = (int) Math.ceil((double) totalRows / LIMIT_PAGE);
        request.setAttribute("listUrl", listUrl);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("thisPage", "url");
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewsAdmin/viewUrl.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewsAdmin/urlForm.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUrl(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String urlPath = request.getParameter("url");
        boolean access = Boolean.parseBoolean(request.getParameter("access"));
        Url newUrl = new Url();
        newUrl.setUrl(urlPath);
        newUrl.setAccess(access);
        urlDAO.createUrl(newUrl);
        response.sendRedirect("url");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Url existingUrl = urlDAO.getUrlById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewsAdmin/urlForm.jsp");
        request.setAttribute("url", existingUrl);
        dispatcher.forward(request, response);
    }

    private void updateUrl(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String urlPath = request.getParameter("url");
        boolean access = Boolean.parseBoolean(request.getParameter("access"));
        Url url = new Url();
        url.setId(id);
        url.setUrl(urlPath);
        url.setAccess(access);
        urlDAO.updateUrl(url);
        response.sendRedirect("url");
    }

    private void deleteUrl(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        urlDAO.deleteUrl(id);
        response.sendRedirect("url");
    }
}
