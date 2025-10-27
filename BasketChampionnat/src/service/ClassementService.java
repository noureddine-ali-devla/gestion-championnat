package service;

import dao.MatchDAO;
import dao.EquipeDAO;
import model.Match;
import model.Equipe;
import model.Statistique;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ClassementService {
    private MatchDAO matchDAO = new MatchDAO();
    private EquipeDAO equipeDAO = new EquipeDAO();

    public Map<Equipe, Statistique> calculerClassement() {
        List<Equipe> equipes = equipeDAO.findAll();
        List<Match> matchs = matchDAO.findAll();

        Map<Equipe, Statistique> classement = new HashMap<>();
        for (Equipe e : equipes) {
            classement.put(e, new Statistique(e));
        }

        for (Match m : matchs) {

            sDom.setButsMarques(sDom.getButsMarques() + m.getScoreDomicile());
            sDom.setButsEncaisses(sDom.getButsEncaisses() + m.getScoreExterieur());

            sExt.setButsMarques(sExt.getButsMarques() + m.getScoreExterieur());
            sExt.setButsEncaisses(sExt.getButsEncaisses() + m.getScoreDomicile());

            if (m.getScoreDomicile() > m.getScoreExterieur()) {
                sDom.setVictoires(sDom.getVictoires() + 1);
                sExt.setDefaites(sExt.getDefaites() + 1);
            } else if (m.getScoreDomicile() < m.getScoreExterieur()) {
                sExt.setVictoires(sExt.getVictoires() + 1);
                sDom.setDefaites(sDom.getDefaites() + 1);
        }

        return classement.entrySet().stream()
                .sorted((e1, e2) -> Integer.compare(e2.getValue().getPoints(), e1.getValue().getPoints()))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
    }
}




