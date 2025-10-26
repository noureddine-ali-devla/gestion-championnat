package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.ClassementService;
import java.io.IOException;
import java.util.List;
import model.Statistique;

@WebServlet("/classement")
public class ClassementServlet extends HttpServlet {
    private ClassementService classementService = new ClassementService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Statistique> classement = classementService.getClassement();
        request.setAttribute("classement", classement);
        request.getRequestDispatcher("pages/classement.jsp").forward(request, response);
    }
}


