
Un cuadrado mágico de orden n, es un cuadrado con los números ${1, . . . , n²}$, tal que todas sus
filas, columnas y las dos diagonales suman lo mismo (ver figura). El número que suma cada fila es llamado número mágico.

#image("magicuadrado-enunciado.png", width: 20%)

Existen muchos métodos para generar cuadrados mágicos. El objetivo de este ejercicio es contar
cuántos cuadrados mágicos de orden n existen.

#line(
  length: 100%,
  stroke: 0.5pt
)

*a) ¿Cuántos cuadrados habría que generar para encontrar todos los cuadrados mágicos si se
utiliza una solución de fuerza bruta?*

*Rta:* Habría que generar $n^2 !$ cuadrados.

#line(
  length: 100%,
  stroke: 0.5pt
)

*b) Enunciar un algoritmo que use backtracking para resolver este problema que se base en la
siguientes ideas:*

- La solución parcial tiene los valores de las primeras $i − 1$ filas establecidos, al igual que los valores de las primeras j columnas de la fila i.

- Para establecer el valor de la posición $(i, j +1)$ (o $(i+1, 1)$ si $j = n$ e $i != n$) se consideran todos los valores que aún no se encuentran en el cuadrado. Para cada valor posible, se establece dicho valor en la posición y se cuentan todos los cuadrados mágicos con esta nueva solución parcial.
Mostrar los primeros dos niveles del árbol de backtracking para n = 3.

*Idea inicial:* 

```
Genero una matriz inicial M de nxn
res = 0

mc(M,i,j):
  --Le asigno un valor del conj {1...n^2} a M[i][j], n^2 veces, luego:
    si i>n or j>n:
      break loop

    si i=0 y j=0:
      --genero un vector V de tamaño n^2 tal que si es 1 está ocupado, si es 0 no.

    si i=n y j=n:
      si M es magicuadrado:
        res+=1
      si j=n e i!=n:
        return mc(M.copy,i+1,1)
      sino
        return mc(M.copy,i,j+1)

  return res
```

Falta formalizar bastante el algoritmo y probar su correctitud.


#line(
  length: 100%,
  stroke: 0.5pt
)

*c) Demostrar que el árbol de backtracking tiene $O(n^2 !)$ nodos en peor caso.*

Nota: Cada nodo es $O(1)$ en este caso.

El $k-"ésimo"$ nivel del árbol de recursión tiene $k$ posiciones ocupadas y $n^2-k$ sin usar, esto significa que en el $k-"ésimo"$ nivel tenemos 

$ n^2 dot (n^2-1) dot ... dot (n^2-k+1) = (n^2 !)/(n^2-k)! "nodos en la altura k" $

Y en total tenemos $n^2$ nodos niveles, por lo que tendremos

$ sum_(k=0)^n^2 (n^2 !)/(n^2-k)! "nodos totales" $

Y el término dominante es $n^2 !$, por lo que es $O(n^2 !)$ (que de hecho, es el número de hojas)


#text(red, strong[Nota de color:]) si quisieramos formalizar más, podríamos decir que:

$ sum_(k=0)^n^2 (n^2 !)/(n^2-k)! = n^2 ! dot sum_(k=0)^n^2 1/(n^2-k)! $

Luego, el segundo término no es más que los primeros $n^2$ términos de la serie de Euler, Entonces:


$ sum_(k=0)^n^2 1/(n^2-k)! approx e $

Y entonces nos queda

$ sum_(k=0)^n^2 (n^2 !)/(n^2-k)! approx e dot n^2 ! "y esto es" O(n^2 !) $

#line(
  length: 100%,
  stroke: 0.5pt
)

*d) Considere la siguiente poda al árbol de backtracking: al momento de elegir el valor de una
nueva posición, verificar que la suma parcial de la fila no supere el número mágico. Verificar
también que la suma parcial de los valores de las columnas no supere el número mágico.
Introducir estas podas al algoritmo e implementarlo en la computadora. ¿Puede mejorar
estas podas?*

Se podría mejorar chequeando las diagonales, otra poda posible es ver si los $k$ elementos restantes podrían llegar a sumar el restante necesario del número mágico.

#line(
  length: 100%,
  stroke: 0.5pt
)

*e) Demostrar que el número mágico de un cuadrado mágico de orden n es siempre $(n^3 +
n)/2$. Adaptar la poda del algoritmo del ítem anterior para que tenga en cuenta esta nueva
información. Modificar la implementación y comparar los tiempos obtenidos para calcular
la cantidad de cuadrados mágicos.*

#let hat = $\u{1F3A9}$

Llamemos al número mágico: $hat$

Tenemos exactamente $n$ filas, $n$ columnas, alcanza ver que $n$ filas ó columnas suman el número mágico.

Entonces tenemos $n$ columnas tal que cada una suma $hat$, esto vale exactamente $n dot hat$, pero también sabemos que cada número del magicuadrado es diferente y tenemos en total los primeros $n^2$ naturales, esto es:

$ sum_(i=1)^n^2 i =_("gauss") (n^2(n^2+1))/2 $

Entonces nos queda que:

$ n dot hat = (n^2(n^2+1))/2 <==> hat = (n^2(n^2+1))/(2 dot n) = (n(n^2+1))/2 = (n^3+n)/2 $

Como queríamos probar (análogo para filas obviamente)