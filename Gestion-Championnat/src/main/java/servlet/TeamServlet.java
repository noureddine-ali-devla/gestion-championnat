package servlet;

import dao.TeamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import model.Team;
import model.User;
import java.io.IOException;
import java.util.List;

public class TeamServlet extends HttpServlet {
    private final TeamDAO teamDAO = new TeamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                request.getRequestDispatcher("/pages/teams/addTeam.jsp").forward(request, response);
                break;
            case "edit":
                Long id = Long.parseLong(request.getParameter("id"));
                request.setAttribute("team", teamDAO.findById(id));
                request.getRequestDispatcher("/pages/teams/modifyTeam.jsp").forward(request, response);
                break;
            case "delete":
                Long deleteId = Long.parseLong(request.getParameter("id"));
                teamDAO.delete(deleteId);
                response.sendRedirect(request.getContextPath() + "/teams?action=list");
                break;
            default:
                List<Team> teams = teamDAO.findAll();
                request.setAttribute("teams", teams);
                request.getRequestDispatcher("/pages/teams/teams.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if ("create".equals(action)) {
            Team team = new Team();
            team.setName(request.getParameter("name"));
            team.setManager(user);
            teamDAO.save(team);
        } else if ("update".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            Team team = teamDAO.findById(id);
            team.setName(request.getParameter("name"));
            teamDAO.update(team);
        }

        response.sendRedirect(request.getContextPath() + "/teams?action=list");
    }
}
