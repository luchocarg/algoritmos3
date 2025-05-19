import java.util.Arrays;
import java.util.Stack;

public class MaxMex {
    public static int[] maxMex(int[] S) {
    int[] R = new int[S.length];
    Arrays.fill(R, -1);

    Stack<Integer> pila = new Stack<>();
    
    for (int j:S) {
        if (j < S.length) R[j] = j;
        else pila.push(j);
    }
    
    for (int j=0; j < R.length ;j++) if (R[j] == -1) R[j] = pila.pop();

    return R;
    }
}