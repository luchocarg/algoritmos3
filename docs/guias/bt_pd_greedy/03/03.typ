#image("image.png", width: 90%)

#line(
  length: 100%,
  stroke: 0.5pt
)

== a)

```
I_maximo = {}
suma_maxima = -inf 

bt (pos, I):    //k entero, I conjunto

  //Caso base 
  Si |I| = k
    sum_total = 0
    para toda permutación i,j de [1 ... k]
      sum_total += M(I[i],I[j])
    
    si total > suma_maxima:
      suma_maxima = total
      I_maximo = I
    return

  //Paso recursivo
  para todo i en [pos ... n]:
    bt(i+1,I+{i})

//Se resuelve con:

bt(0,{})
//Luego, el resultado es I_maximo.
```

== b)

Tenemos $binom(n^2,k)$ ramas, cada una $O(1)$ y cada hoja es $O(k^2)$

Luego la complejidad temporal es $O(binom(n^2,k) dot k²)$

La complejidad espacial es $O(k)$, dado que solo usamos un vector $I$ de tamaño $k$

== c)

Una poda podría ser teniendo una solución completa (i.e. $|I|=k$) ver que la suma restante para una solución parcial $I',|I|'<=k$ puede llegar a ser mayor a la suma de la solución máxima actual y dejar de recorrer la rama caso contrario.