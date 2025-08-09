import java.util.List;
import java.util.PriorityQueue;

public class SumaGolosa {
    public static int sg(List<Integer> S) {
        PriorityQueue<Integer> heap = new PriorityQueue<>(S);
        int x,y;
        int total = 0;

        while(heap.size() > 1) {
            x = heap.poll();
            y = heap.poll();
            
            heap.offer(x+y);
            total += x+y;
        }

        return total;
    }
}