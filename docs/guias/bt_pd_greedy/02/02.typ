Un cuadrado mágico de orden n, es un cuadrado con los números ${1, . . . , n_2}$, tal que todas sus
filas, columnas y las dos diagonales suman lo mismo (ver figura). El número que suma cada fila es llamado número mágico.

#image("magicuadrado-enunciado.png", width: 20%)

Existen muchos métodos para generar cuadrados mágicos. El objetivo de este ejercicio es contar
cuántos cuadrados mágicos de orden n existen.

*a) ¿Cuántos cuadrados habría que generar para encontrar todos los cuadrados mágicos si se
utiliza una solución de fuerza bruta?*

*b) Enunciar un algoritmo que use backtracking para resolver este problema que se base en la
siguientes ideas:*

- La solución parcial tiene los valores de las primeras $i − 1$ filas establecidos, al igual que los valores de las primeras j columnas de la fila i.
- Para establecer el valor de la posición $(i, j +1)$ (o $(i+1, 1)$ si $j = n$ e $i != n$) se consideran todos los valores que aún no se encuentran en el cuadrado. Para cada valor posible, se establece dicho valor en la posición y se cuentan todos los cuadrados mágicos con esta nueva solución parcial.
Mostrar los primeros dos niveles del árbol de backtracking para n = 3.


c) Demostrar que el árbol de backtracking tiene $O((n^2)!)$ nodos en peor caso.

d) Considere la siguiente poda al árbol de backtracking: al momento de elegir el valor de una
nueva posición, verificar que la suma parcial de la fila no supere el número mágico. Verificar
también que la suma parcial de los valores de las columnas no supere el número mágico.
Introducir estas podas al algoritmo e implementarlo en la computadora. ¿Puede mejorar
estas podas?

e) Demostrar que el número mágico de un cuadrado mágico de orden n es siempre $(n^3 +
n)/2$. Adaptar la poda del algoritmo del ítem anterior para que tenga en cuenta esta nueva
información. Modificar la implementación y comparar los tiempos obtenidos para calcular
la cantidad de cuadrados mágicos.