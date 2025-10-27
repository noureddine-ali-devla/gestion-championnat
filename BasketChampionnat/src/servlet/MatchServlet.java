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
            request.setAttribute("matchs", matchs);
            request.getRequestDispatcher("pages/matchs.jsp").forward(request, response);
        } else if ("supprimer".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.supprimerMatch(id);
            response.sendRedirect("matchs");
        } else if ("details".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Match m = service.getMatchById(id);
            request.setAttribute("match", m);
            request.getRequestDispatcher("pages/match/detailsMatch.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int equipeDomId = Integer.parseInt(request.getParameter("domicileId"));
        int equipeExtId = Integer.parseInt(request.getParameter("exterieurId"));
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        int scoreDom = Integer.parseInt(request.getParameter("scoreDomicile"));
        int scoreExt = Integer.parseInt(request.getParameter("scoreExterieur"));

        Equipe dom = service.getEquipeById(equipeDomId);
        Equipe ext = service.getEquipeById(equipeExtId);

        Match m = new Match(dom, ext, date, scoreDom, scoreExt, scoreDom > scoreExt);
        service.ajouterMatch(m);
        response.sendRedirect("matchs");
    }
}


