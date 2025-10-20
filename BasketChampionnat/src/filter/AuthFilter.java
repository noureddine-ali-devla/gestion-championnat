package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    private static final String[] EXCLUDED_PATHS = {
        "/login.jsp",
        "/register.jsp",
        "/auth",
        "/assets/",
        "/logout"
    };

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String path = req.getRequestURI();

        boolean excluded = false;
        for (String excludedPath : EXCLUDED_PATHS) {
            if (path.contains(excludedPath)) {
                excluded = true;
                break;
            }
        }

        if (!excluded) {
            if (session == null || session.getAttribute("user") == null) {
                res.sendRedirect(req.getContextPath() + "/login.jsp");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
