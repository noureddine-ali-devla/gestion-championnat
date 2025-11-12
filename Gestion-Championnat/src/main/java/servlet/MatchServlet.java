package servlet;

import dao.MatchDAO;
import dao.TeamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import model.Match;
import model.Team;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class MatchServlet extends HttpServlet {
    private final MatchDAO matchDAO = new MatchDAO();
    private final TeamDAO teamDAO = new TeamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                List<Team> teams = teamDAO.findAll();
                request.setAttribute("teams", teams);
                request.getRequestDispatcher("/pages/matches/addMatch.jsp").forward(request, response);
                break;

            case "edit":
                Long id = Long.parseLong(request.getParameter("id"));
                request.setAttribute("match", matchDAO.findById(id));
                request.setAttribute("teams", teamDAO.findAll());
                request.getRequestDispatcher("/pages/matches/modifyMatch.jsp").forward(request, response);
                break;

            case "delete":
                Long deleteId = Long.parseLong(request.getParameter("id"));
                matchDAO.delete(deleteId);
                response.sendRedirect("matches?action=list");
                break;

            default:
                request.setAttribute("matches", matchDAO.findAll());
                request.getRequestDispatcher("/pages/matches/matches.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Parse match date from input type="datetime-local"
        String matchDateStr = request.getParameter("matchDate");
        LocalDateTime matchDate = null;
        if (matchDateStr != null && !matchDateStr.isEmpty()) {
            try {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                matchDate = LocalDateTime.parse(matchDateStr, formatter);
            } catch (Exception e) {
                throw new ServletException("Invalid date format: " + matchDateStr, e);
            }
        } else {
            throw new ServletException("Match date is required");
        }

        if ("create".equals(action)) {
            Match match = new Match();
            match.setTeam1(teamDAO.findById(Long.parseLong(request.getParameter("team1Id"))));
            match.setTeam2(teamDAO.findById(Long.parseLong(request.getParameter("team2Id"))));
            match.setMatchDate(matchDate);
            matchDAO.save(match);

        } else if ("update".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            Match match = matchDAO.findById(id);
            match.setTeam1(teamDAO.findById(Long.parseLong(request.getParameter("team1Id"))));
            match.setTeam2(teamDAO.findById(Long.parseLong(request.getParameter("team2Id"))));
            match.setMatchDate(matchDate);
            matchDAO.update(match);
        }

        response.sendRedirect("matches?action=list");
    }
}
