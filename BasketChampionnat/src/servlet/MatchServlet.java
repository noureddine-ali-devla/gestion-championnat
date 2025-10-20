package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.ChampionnatService;
import model.Match;
import model.Equipe;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/matchs")
public class MatchServlet extends HttpServlet {
    private ChampionnatService service = new ChampionnatService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            List<Match> matchs = service.getMatchs();
            List<Equipe> equipes = service.getEquipes();
            request.setAttribute("matchs", matchs);
            request.setAttribute("equipes", equipes);
            request.getRequestDispatcher("pages/matchs.jsp").forward(request, response);
        } else if (action.equals("score")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Match m = service.getMatchById(id);
            request.setAttribute("match", m);
            request.getRequestDispatcher("pages/match-score.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("ajouter")) {
            int idEquipeA = Integer.parseInt(request.getParameter("idEquipeA"));
            int idEquipeB = Integer.parseInt(request.getParameter("idEquipeB"));
            LocalDate date = LocalDate.parse(request.getParameter("date"));
            Equipe equipeA = service.getEquipeById(idEquipeA);
            Equipe equipeB = service.getEquipeById(idEquipeB);
            int id = service.getMatchs().size() + 1;
            Match m = new Match(id, equipeA, equipeB, date);
            service.ajouterMatch(m);
            response.sendRedirect("matchs");
        } else if (action != null && action.equals("enregistrerScore")) {
            int idMatch = Integer.parseInt(request.getParameter("idMatch"));
            int scoreA = Integer.parseInt(request.getParameter("scoreA"));
            int scoreB = Integer.parseInt(request.getParameter("scoreB"));
            service.enregistrerScore(idMatch, scoreA, scoreB);
            response.sendRedirect("matchs");
        }
    }
}
