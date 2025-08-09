#image("image.png")
#image("image-4.png")
#line(length: 100%)
#image("image-1.png")

```
Algoritmo1(G):
  Para cada arista e ∈ E(G): //Doy vuelta los pesos para buscar el AGMáx, O(m)
    c(e) = -c(e)

  AGM <- Prim(G) //O(m+n log n)

  //Recupero los pesos originales, es AGM, hay n-1 aristas, n nodos, O(n)
  Para cada v en AGM:
    Para cada w en AGM[v]:
      c(v,w) = -c(v,w)

  minimo = inf 
  Para cada v en AGM:
    Para cada w en AGM[v]:
      si c(v,w) < minimo:
        minimo := c(v,w)

  return minimo

La complejidad final es O(n+m+n log n) ∈ O(m + n log n)
``` 

#line(length: 100%)
#image("image-2.png")

#image("image-3.png")

```
Algoritmo2(G):
  Para cada arista e ∈ E(G): //Doy vuelta los pesos para buscar el AGMáx, O(m)
    c(e) = -c(e)

  AGM <- Prim(G) //O(m+n log n)

  //Veo para toda arista del AGM, hay n-1 aristas, n nodos, O(n)
  Para cada v en AGM:
    Para cada w en AGM[v]:
      c(v,w) = -c(v,w) //recupero el peso original

  pesos_AGM = []

  Para cada v en AGM:
    Para cada w en AGM[v]:
      pesos_AGM.agregar(c(v,w)) 
  
  sol <- sort(pesos_AGM)

  sol.agregar(inf)

  return sol
```

Lo que habría que ver es lo siguiente, es bastante sencilla la inducción, pero como el enunciado no lo pide, no lo voy a probar. (`sol` es 0-indexed). 

$ forall i, 0<=i<n ->_L a_i = cases(
  "sol"[i] &"si" i<n-1,
  infinity &"si" i = n-1) $


Plantear: 
- caso base $k=0$
- caso inductivo $1<=k<n-1$
- caso $k=n-1$



