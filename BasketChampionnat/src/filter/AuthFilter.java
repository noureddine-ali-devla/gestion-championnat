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

    // Pages publiques à exclure du filtrage
    private static final String[] EXCLUDED_PATHS = {
        "/pages/login.jsp",
        "/pages/register.jsp",
        "/auth",
        "/assets/",
        "/logout"
    };

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Rien à initialiser
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        // Chemin relatif au contexte
        String path = req.getRequestURI().substring(req.getContextPath().length());

        // Vérifie si le chemin est exclu
        boolean excluded = false;
        for (String excludedPath : EXCLUDED_PATHS) {
            if (path.startsWith(excludedPath)) {
                excluded = true;
                break;
            }
        }

        // Si la page n'est pas exclue, vérifier session
        if (!excluded) {
            if (session == null || session.getAttribute("user") == null) {
                // Rediriger vers login
                res.sendRedirect(req.getContextPath() + "/pages/login.jsp");
                return;
            }
        }

        // Continuer la requête
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Rien à détruire
    }
}
