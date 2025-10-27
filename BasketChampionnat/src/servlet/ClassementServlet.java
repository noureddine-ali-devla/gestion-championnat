package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.ClassementService;
import model.Equipe;
import model.Statistique;

import java.io.IOException;
import java.util.Map;

@WebServlet("/classement")
public class ClassementServlet extends HttpServlet {
    private ClassementService service = new ClassementService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<Equipe, Statistique> classement = service.calculerClassement();
        request.setAttribute("classement", classement);
        request.getRequestDispatcher("pages/classement.jsp").forward(request, response);
    }
}



