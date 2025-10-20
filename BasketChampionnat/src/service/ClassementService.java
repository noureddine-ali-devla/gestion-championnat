package service;

import dao.EquipeDAO;
import dao.MatchDAO;
import model.Equipe;
import model.Match;
import model.Statistique;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class ClassementService {
    private final EquipeDAO equipeDAO = new EquipeDAO();
    private final MatchDAO matchDAO = new MatchDAO();

    public void mettreAJourStatistiques() {
        List<Equipe> equipes = equipeDAO.findAll();
        List<Match> matchs = matchDAO.findAll();

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();

            for (Equipe equipe : equipes) {
                Statistique stats = equipe.getStatistique();
                if (stats == null) {
                    stats = new Statistique(equipe);
                    equipe.setStatistique(stats);
                }
                stats.setMatchsJoues(0);
                stats.setVictoires(0);
                stats.setDefaites(0);
                stats.setButsMarques(0);
                stats.setButsEncaisses(0);

                for (Match match : matchs) {
                    if (match.getEquipeDomicile().getId() == equipe.getId()) {
                        stats.setMatchsJoues(stats.getMatchsJoues() + 1);
                        stats.setButsMarques(stats.getButsMarques() + match.getScoreDomicile());
                        stats.setButsEncaisses(stats.getButsEncaisses() + match.getScoreExterieur());
                        if (match.getScoreDomicile() > match.getScoreExterieur()) stats.setVictoires(stats.getVictoires() + 1);
                        else stats.setDefaites(stats.getDefaites() + 1);
                    } else if (match.getEquipeExterieur().getId() == equipe.getId()) {
                        stats.setMatchsJoues(stats.getMatchsJoues() + 1);
                        stats.setButsMarques(stats.getButsMarques() + match.getScoreExterieur());
                        stats.setButsEncaisses(stats.getButsEncaisses() + match.getScoreDomicile());
                        if (match.getScoreExterieur() > match.getScoreDomicile()) stats.setVictoires(stats.getVictoires() + 1);
                        else stats.setDefaites(stats.getDefaites() + 1);
                    }
                }

                session.merge(stats);
                session.merge(equipe);
            }

            transaction.commit();
        }
    }

    public List<Statistique> getClassement() {
        mettreAJourStatistiques();
        List<Equipe> equipes = equipeDAO.findAll();
        List<Statistique> classement = new ArrayList<>();

        for (Equipe e : equipes) {
            if (e.getStatistique() != null) classement.add(e.getStatistique());
        }

        classement.sort(Comparator.comparingInt(Statistique::getPoints).reversed()
                .thenComparingInt(Statistique::getDifferenceButs).reversed());

        return classement;
    }
}


