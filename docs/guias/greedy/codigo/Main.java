import java.util.*;

public class Main {
    public static void main(String[] args) {
        List<Integer> l1 = List.of(1,2,4,6);
        List<Integer> l2 = List.of(1,5,5,7,9);

        List<Integer> l3 = List.of(1,1,1,1,1);
        List<Integer> l4 = List.of(1,2,3);

        int parejas1 = ParejasDeBaile.parejasDeBaile(l1, l2);
        int parejas2 = ParejasDeBaile.parejasDeBaile(l3, l4);

        System.out.println("Parejas ejemplo 1: " + parejas1);
        System.out.println("Parejas ejemplo 2: " + parejas2);
        
        int sumas1 = SumaSelectiva.ssnlogn(new ArrayList<>(Arrays.asList(4,1,7,2,5)),3);
        int sumas2 = SumaSelectiva.ssnlogk(new ArrayList<>(Arrays.asList(4,1,7,2,5)),3);
        System.out.println("SumaSelectiva O(n logn): " + sumas1);
        System.out.println("SumaSelectiva O(n logk): " + sumas2);

        int sumag = SumaGolosa.sg(new ArrayList<>(Arrays.asList(1,2,5)));
        System.out.println("SumaGolosa {1,2,5}: " + sumag);

        List<Integer> Ruta = RutaEficiente.rutaEficiente(new ArrayList<>(Arrays.asList(0, 1, 2, 3, 4, 5, 6, 7)), 1);
        System.out.println("RutaEficiente: " + Ruta);

        int[] maxmex = MaxMex.maxMex(new int[]{3,4,5,7,33,0,1});
        System.out.println("MaxMax: " + java.util.Arrays.toString(maxmex));
    }
}
