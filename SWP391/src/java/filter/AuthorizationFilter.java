package filter;

import dao.AuthorizeDAO;
import dto.ErrorStatus;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;
import model.User;

@WebFilter("/*")
public class AuthorizationFilter implements Filter {

    private AuthorizeDAO authorizeDAO;
    private static final List<String> STATIC_RESOURCES_EXTENSIONS = Arrays.asList(
            ".css", ".js", ".png", ".jpg", ".jpeg", ".gif", ".woff", ".ttf", ".svg"
    );

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        authorizeDAO = new AuthorizeDAO();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String uri = httpRequest.getRequestURI();

        if (isStaticResource(uri)) {
            chain.doFilter(request, response);
            return;
        }

        // Assume that the role ID is stored in the session
        User user = (User) httpRequest.getSession().getAttribute("account");
        Integer roleId = null;
        if (user != null) {
            roleId = user.getRole_id(); // Assuming role ID is retrieved this way
        }
        String urlPath = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

        try {
            ErrorStatus status = authorizeDAO.checkAccess(roleId, urlPath);

            if (urlPath.equalsIgnoreCase("/accessDenied.jsp")) {
                chain.doFilter(request, response);
                return;
            }

            switch (status.getStatusCode()) {
                case 200:
                    chain.doFilter(request, response);
                    break;
                case 403:
                case 404:
                    httpRequest.setAttribute("errorCode", status.getStatusCode());
                    httpRequest.setAttribute("errorMessage", status.getMessage());
                    httpRequest.getRequestDispatcher("/accessDenied.jsp").forward(httpRequest, httpResponse);
                    break;
                case 500:
                    httpResponse.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, status.getMessage());
                    break;
                default:
                    httpResponse.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown error occurred");
                    break;
            }
        } catch (Exception e) {
            throw new ServletException("Authorization check failed", e);
        }
    }

    private boolean isStaticResource(String uri) {
        for (String extension : STATIC_RESOURCES_EXTENSIONS) {
            if (uri.endsWith(extension)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void destroy() {
        // Clean up resources
    }
}
