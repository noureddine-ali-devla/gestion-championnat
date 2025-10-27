package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.ChampionnatService;
import model.Joueur;
import model.Equipe;

import java.io.IOException;
import java.util.List;

@WebServlet("/joueurs")
public class JoueurServlet extends HttpServlet {
    private ChampionnatService service = new ChampionnatService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            List<Joueur> joueurs = service.getJoueurs();
            request.setAttribute("joueurs", joueurs);
            request.getRequestDispatcher("pages/joueurs.jsp").forward(request, response);
        } else if ("supprimer".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.supprimerJoueur(id);
            response.sendRedirect("joueurs");
        } else if ("details".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Joueur j = service.getJoueurById(id);
            request.setAttribute("joueur", j);
            request.getRequestDispatcher("pages/joueur/detailsJoueur.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String poste = request.getParameter("poste");
        int numero = Integer.parseInt(request.getParameter("numero"));
        int points = Integer.parseInt(request.getParameter("points"));
        int equipeId = Integer.parseInt(request.getParameter("equipeId"));
        Equipe equipe = service.getEquipeById(equipeId);
        Joueur j = new Joueur(nom, prenom, poste, numero, points, equipe);
        service.ajouterJoueur(j);
        response.sendRedirect("joueurs");
    }
}



