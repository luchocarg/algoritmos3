= Teorema maestro

$ T(n)=a T(n/b)+f(n) $

$r=log_b (a)$

- $f(n)<-Theta(n^c)$ y $c<r$ $=> T in Theta(n^r)$ 
- $f(n)<-Theta(n^c)$ y $c>r$ $=> T in Theta(n^c)$
- $f(n)<-Theta(n^r log^k n)$ $=> T in Theta(n^r log^(k+1) n)$

