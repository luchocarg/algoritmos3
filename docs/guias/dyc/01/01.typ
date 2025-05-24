#image("image-1.png")

== Algoritmo

```python
def IzqDom(A):
    n = len(A)
    if n == 1: #O(1)
        return True

    mid = n//2 #O(1)
    izq = A[:mid] #O(n/2) ∈ O(n)
    der = A[mid:] #O(n/2) ∈ O(n)

    if sum(izq) > sum(der): #O(n/2 + n/2) = O(n)
        return IzqDom(izq) and IzqDom(der) #recursión 
    else:
        return False
```
== Complejidad

$ T(n) = 2 T(n/2)+ O(n) $

Por teorema maestro: $ underbrace(log_2 2, log_b a) = underbrace(1,c) ==> T(n) = Theta(n^(log_2 2) log n) in Theta(n log n) $

Y alcanza con ver que $O(n log n) subset O(n^2)$

$ lim_(n->infinity) (n log n)/n^2 = lim_(n->infinity) (log n) / n =_"LH" lim_(n->infinity) 1/n = 0 $