import java.util.List;

public class ParejasDeBaile {
    public static int parejasDeBaile(List<Integer> S, List<Integer> R) {
        int n = S.size();
        int res = 0;

        int j = 0;
        
        for (int i = 0; i < n && j < R.size(); i++) {
            if (Math.abs(S.get(i)-R.get(j)) <= 1) {
                j += 1;
                res += 1;
            } 
        }
        return res;
    }
}