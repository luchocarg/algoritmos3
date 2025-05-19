import java.util.*;

public class RutaEficiente {
    public static List<Integer> rutaEficiente(List<Integer> S, int C) {
        int n = S.size();
        List<Integer> R = new ArrayList<>();

        int a = 0;
        R.add(S.get(0));

        for (int j = 1; j<n ;j++) {
            if (S.get(j)-S.get(a) > C) {
                a = j-1;
                R.add(S.get(a));
            }
        }

        return R;
    }
}