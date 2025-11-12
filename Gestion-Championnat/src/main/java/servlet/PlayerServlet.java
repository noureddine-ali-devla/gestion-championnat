package servlet;

import dao.PlayerDAO;
import dao.TeamDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import model.Player;
import java.io.IOException;

public class PlayerServlet extends HttpServlet {
    private final PlayerDAO playerDAO = new PlayerDAO();
    private final TeamDAO teamDAO = new TeamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            request.setAttribute("players", playerDAO.findAll());
            request.getRequestDispatcher("/pages/players/PlayerList.jsp").forward(request, response);
        } else if (action.equals("addForm")) {
            request.setAttribute("teams", teamDAO.findAll());
            request.getRequestDispatcher("/pages/players/addPlayer.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            Long id = Long.parseLong(request.getParameter("id"));
            request.setAttribute("player", playerDAO.findById(id));
            request.setAttribute("teams", teamDAO.findAll());
            request.getRequestDispatcher("/pages/players/updatePlayer.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            Long id = Long.parseLong(request.getParameter("id"));
            playerDAO.delete(id);
            response.sendRedirect(request.getContextPath() + "/players?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Player p = new Player();
            p.setName(request.getParameter("name"));
            p.setPosition(request.getParameter("position"));
            p.setTeam(teamDAO.findById(Long.parseLong(request.getParameter("teamId"))));
            playerDAO.save(p);
        } else if ("update".equals(action)) {
            Long id = Long.parseLong(request.getParameter("id"));
            Player p = playerDAO.findById(id);
            p.setName(request.getParameter("name"));
            p.setPosition(request.getParameter("position"));
            p.setTeam(teamDAO.findById(Long.parseLong(request.getParameter("teamId"))));
            playerDAO.update(p);
        }

        response.sendRedirect(request.getContextPath() + "/players?action=list");
    }
}

