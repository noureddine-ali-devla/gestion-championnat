package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class AuthFilter implements Filter {

    private static final String[] EXCLUDED_PATHS = {
        "/pages/login.jsp",
        "/pages/register.jsp",
        "/auth",
        "/assets/",
        "/logout"
    };

    @Override
    public void init(FilterConfig filterConfig) {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String path = req.getRequestURI().substring(req.getContextPath().length());

        boolean excluded = false;
        for (String p : EXCLUDED_PATHS) {
            if (path.startsWith(p)) {
                excluded = true;
                break;
            }
        }

        if (!excluded) {
            if (session == null || session.getAttribute("user") == null) {
                res.sendRedirect(req.getContextPath() + "/pages/login.jsp");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
