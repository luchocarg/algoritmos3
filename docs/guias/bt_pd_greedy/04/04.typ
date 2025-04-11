#image("image.png")

== a)

```
n, D dados por enunciado.
minimo = inf
perm_minimal = {}

f bt(pi, usados, suma):
  si |pi| es n:
    total = suma + D[pi[n]][pi[1]]
    si suma < minimo:
      minimo = suma
      perm_minimal = pi[n][1]

  para cada i en 1...k:
    si i no está en usados
      si pi es vacio:
        sol = 0
      sino:
        sol = suma + D[pi[k][i]]

      bt(pi+{i}, usados+{i}, sol)

      pi = pi sin el ultimo elemento
      usados = usados-{i}

bt({},{},0)
solucion = perm_minimal
```

== b)

Un conjunto de $n$ elementos tiene $n!$ permutaciones, y hacemos $n$ operaciones por paso, luego la complejidad temporal es $O(n! dot n)$

usados es $O(n)$, al igual que pi. Luego la complejidad espacial es el tamaño de $D$, $O(n^2)$

== c)

Una poda podría ser dejar de recorrer ramas que superan el minimo actual.