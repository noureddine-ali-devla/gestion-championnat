package service;

import model.Equipe;
import model.Statistique;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ClassementService {
    public List<Statistique> genererClassement(List<Equipe> equipes) {
        List<Statistique> stats = new ArrayList<>();
        for (Equipe e : equipes) {
            stats.add(new Statistique(e));
        }
        Collections.sort(stats, new Comparator<Statistique>() {
            public int compare(Statistique s1, Statistique s2) {
                if (s2.getPoints() != s1.getPoints())
                    return Integer.compare(s2.getPoints(), s1.getPoints());
                if (s2.getDifferenceButs() != s1.getDifferenceButs())
                    return Integer.compare(s2.getDifferenceButs(), s1.getDifferenceButs());
                return Integer.compare(s2.getButsMarques(), s1.getButsMarques());
            }
        });
        return stats;
    }
}

