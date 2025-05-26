import java.util.*;

public class Main {
    public static void main(String[] args) {
    }
}

class Grafo {
    private final int n;
    private final List<List<Integer>> ady;

    public Grafo(int n) {
        this.n = n;
        ady = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            ady.add(new ArrayList<>());
        }
    }

    public void agregarArista(int u, int v) {
        ady.get(u).add(v);
    }

    public List<Integer> vecinos(int u) {
        return ady.get(u);
    }

    public int cantidadNodos() {
        return n;
    }
}


class Algoritmos {
    public enum EstadoNodo {
        SIN_VISITAR,
        VISITANDO,
        VISITADO
    }
    public static int[] bfs(Grafo G, int v) {
        int n = G.cantidadNodos();
        EstadoNodo[] estado = new EstadoNodo[n];
        Arrays.fill(estado, EstadoNodo.SIN_VISITAR);

        int[] padre = new int[n];
        Arrays.fill(padre, -1);

        Queue<Integer> Q = new LinkedList<>();

        estado[v] = EstadoNodo.VISITANDO;
        Q.offer(v);

        while (!Q.isEmpty()) {
            int w = Q.poll();
            estado[w] = EstadoNodo.VISITADO;

            for (int u : G.vecinos(w)) {
                if (estado[u] == EstadoNodo.SIN_VISITAR) {
                    estado[u] = EstadoNodo.VISITANDO;
                    padre[u] = w;
                    Q.offer(u);
                }
            }
        }

        return padre;
    }

    public static List<Integer> reconstruirCamino(int[] padres, int v) {
        List<Integer> camino = new ArrayList<>();
        for (int w = v; w != -1; w = padres[w]) {
            camino.add(w);
        }
        Collections.reverse(camino);
        return camino;
    }

    public static Grafo obtenerArbolBFS(int[] padres) {
        int n = padres.length;
        Grafo T = new Grafo(n);

        for (int v = 0; v < n; v++) {
            int p = padres[v];
            if (p != -1) {
                T.agregarArista(p, v);
            }
        }

        return T;
    }
}