#image("image-1.png")

#image("image-2.png")

```java
    public static int ParejasDeBaile(List<Integer> S, List<Integer> R) {
        int n = S.size();
        int res = 0;
        int j = 0;
        
        for (int k = 0; k < n && j < R.size(); k++) {
            if (Math.abs(S.get(k)-R.get(j)) <= 1) {
                j++;
                res++;
            } 
        }
        return res;
    }
```

```
ParejasDeBaile(S,R):
  res = 0
  j = 0

  para cada s ∈ S:
    si |s - R_j| ≤ 1:
      res= res+1
      j = j+1

```

${1,2,4,6}$

${1,5,5,7,9}$

$(1,1), (4,5), (6,7)$ la cantidad máxima de parejas validas.
$G = {g_1,g_2...g_(k-1)}$

$g_1 = (1,1)$

$g_2 = (1,1),(4,5)$

$g_3 = (1,1),(4,5),(6,5)$

$O={o_1,o_2...o_(k-1)}$

$o_3 = (1,1),(4,5),(6,7)$
#pagebreak()





$0<=|s-r|<=1 , forall s in S, r in R$
#line(length: 100%)

S, R ordenados
$ S = {s_1,...,s_n} $

$ R = {r_1,...,r_m} $

$ (s,r) <==> 0<=|s-r|<=1 $

Probar por inducción sobre la cantidad de parejas válidas hasta la k-1 esima iteración que mi solución $G$ es igual de óptima que una solución óptima cualquiera $O$.



#line(length: 100%)

$O'={g_1,g_2...g_(k-1),o_k...o_n}$

$ o_k = g_k$

Si vale esto, vale $forall k, 1<=k<=n$

== Caso base

$k=0$

$|O|=|O'|=0$


== Paso inductivo

$k-1 ==> k$  entonces $G_(k) = (s_k,r_k)$

$O_k = G_k$ listo, ya es optima, ya que $O_k = (s_k, r_k)$


$O_k != G_k$

Tenemos 3 chances

$G_k=(s_k,r_k) $ y tenemos $r'!=r_k in R, s'!= s_k in S$ 

$(s_k,r_k) equiv (r_k,s_k)$ 

- $(s',r')$

- $(s_k,r')$ con $r' > r_k$

- $(s',r_k)$ con $s' > s_k$

$s_k +1 <= s'$

$s_k <= r_k => s_k <= s_k+1 = s'$

$r_k <= s_k => r_k <= r_k +1 = r'$

#line(length: 100%)

Queremos ver que pasa si intercambiamos 

Hasta $G_(k-1)$, sabemos que $G_i$ es igual de optima que $O_i$ con $i<=k-1$



Invariante $ (s,r) <==> 0<=|s-r|<=1$
#pagebreak()

*Caso 1*

$(s',r_k) in O'$ por $(s_k,r_k) in G$

*Hipotesis*

Invariante: $G$ empareja $(s_k,r_k)$ si vale $|s_k-r_k|<=1$

Y tenemos $(s',r_k) in O'$ 

entonces sabemos que $s' > s_k$ y también sabemos que $S$ está ordenado $|s'-r_k| > |s_k-r_k|$ 

La unica chance de que $G$ no haya emparejado $s_k$ con $r_k$ es si $|s_k - r_k| > 1$ esto no puede pasar

$S= {.... s_k,s'...}$

*Caso 2*

$(s_k,r') in O'$ por $(s_k,r_k) in G$

$G_k = (s_k,r_k)$ es pareja valida y queremos ver que como $r' >r_k$ entonces $r'$ queda sin elegir

${...r_k,...,r'...}$

Podría ser elegida por un $s''>s_k$ en un paso siguiente.

*Por lo tanto* $forall O:: exists O'$ optima $| G =O'$ $=> G$ es optima