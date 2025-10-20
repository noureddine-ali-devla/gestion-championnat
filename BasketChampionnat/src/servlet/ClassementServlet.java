package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.ChampionnatService;
import service.ClassementService;
import model.Statistique;
import java.io.IOException;
import java.util.List;

@WebServlet("/classement")
public class ClassementServlet extends HttpServlet {
    private ChampionnatService championnatService = new ChampionnatService();
    private ClassementService classementService = new ClassementService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Statistique> classement = classementService.genererClassement(championnatService.getEquipes());
        request.setAttribute("classement", classement);
        request.getRequestDispatcher("pages/classement.jsp").forward(request, response);
    }
}
