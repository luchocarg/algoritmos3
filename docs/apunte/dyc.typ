= Teorema maestro

$ T(n)=a T(n/b)+f(n) $

$r=log_b (a)$

- $f(n)<-Theta(n^c)$ y $c<r$ $=> T in Theta(n^r)$ 
- $f(n)<-Theta(n^c)$ y $c>r$ $=> T in Theta(n^c)$
- $f(n)<-Theta(n^r log^k n)$ $=> T in Theta(n^r log^(k+1) n)$

= Complejidad de MergeSort

$ T(n) = 2 T(n/2) + n$, luego $r=log_2 2 = 1$ tal que

$ f(n) = Theta(n^1) -> c=1 => r=c$

$=> f(n) <- Theta(n) = Theta(n^1 log^0 n) => Theta(n log n)$

= Problema $n$ baldes 

Tenés $n$ baldes, la mayoría estricta es de un mismo color, quiero preguntarle a mi amigo que dado 2 baldes, qué color es. Quiero el color que pertenece a esa mayoría estricta

```
B una lista

S lista de colores enumerada por indice
Algoritmo(B):
  si tengo 2 baldes o menos, los comparo y sumo uno a S en el color que sea 
  
  si tengo más de 2 baldes, Algoritmo(B:n/2) y Algoritmo((n/2)+1:B)

  devuelvo el mayor de S 
```

???

= Otro ejercicio

Tenemo un array de numero $[1,-2,3,-1,4,-1]$ qv el valor contiguo que mas suma 