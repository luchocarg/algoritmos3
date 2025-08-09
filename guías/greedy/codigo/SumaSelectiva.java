import java.util.List;
import java.util.PriorityQueue;

public class SumaSelectiva {
    public static int ssnlogn(List<Integer> X, int k) {
        int n = X.size();
        X.sort(null); //Es TimSort, O(nlogn)

        int res = 0;
        for (int i = n-k ;i<n ;i++) res+= X.get(i); //O(n)
        return res;
    }

    public static int ssnlogk(List<Integer> X, int k) {
        PriorityQueue<Integer> heap = new PriorityQueue<>();

        for (int x : X) { //O(n)
            heap.offer(x); //O(logk)
            if (heap.size() > k) heap.poll(); //O(logk)
        }

        int res = 0;
        while(!heap.isEmpty()) res+= heap.poll(); //O(logk)

        return res;
    }
}