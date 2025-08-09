#import emoji: face

= Enunciado

En este ejercicio vamos a resolver el problema de suma de subconjuntos con la técnica de back- tracking. Dado un multiconjunto $C = {c_1, . . . , c_n}$ de números naturales y un natural $k$, queremos
determinar si existe un subconjunto de $C$ cuya sumatoria sea $k$. Vamos a suponer fuertemente
que $C$ está ordenado de alguna forma arbitraria pero conocida (i.e., $C$ está implementado como
la secuencia $c_1, . . . , c_n$ o, análogamente, tenemos un iterador de $C$). Las soluciones (candidatas)
son los vectores $a = (a_1, . . . , a_n)$ de valores binarios; el subconjunto de $C$ representado por $a$
contiene a $c_i$ si y sólo si $a_i = 1$. Luego, a es una solución válida cuando
$sum_(i=1)^n a_i c_i = k$. Asimismo,
una solución parcial es un vector $p = (a_1, . . . , a_i)$ de números binarios con $0 ≤ i ≤ n$. Si $i < n$,
las soluciones sucesoras de $p$ son $p ⊕ 0$ y $p ⊕ 1$, donde $⊕$ indica la concatenación.

#line(
  length: 100%,
  stroke: 0.5pt
)

== a) Escribir el conjunto de soluciones candidatas para $C = {6, 12, 6}$ y $k = 12$.
Soluciones candidatas: ${(0,0,0),(1,0,0),(0,1,0),(0,0,1),(1,1,0),(1,0,1),(0,1,1),(1,1,1)}$ o sea, toda combinación posible.

#line(
  length: 100%,
  stroke: 0.5pt
)

== b) Escribir el conjunto de soluciones válidas para $C = {6, 12, 6}$ y $k = 12$.
Conjunto de soluciones válidas: ${(1,0,1),(0,1,0)}$

#line(
  length: 100%,
  stroke: 0.5pt
)

== c) Escribir el conjunto de soluciones parciales para $C = {6, 12, 6}$ y $k = 12$.
Conjunto de soluciones parciales: ${(),(1),(0),(0,0),(0,1),(1,0),(1,1)}$

#line(
  length: 100%,
  stroke: 0.5pt
)

== d) Dibujar el árbol de _backtracking_ correspondiente al algoritmo descrito arriba para $C = {6, 12, 6}$ y $k = 12$, indicando claramente la relación entre las distintas componentes del árbol y los conjuntos de los incisos anteriores.

#image("01-g1.svg")

#line(
  length: 100%,
  stroke: 0.5pt
)

== e) (SimpleTex no lo entiende y no lo voy a escribir a mano)

#image("enunciado-e.png")

*Me convencí!*

#line(
  length: 100%,
  stroke: 0.5pt
)

== f) 

Convencerse de que la siguiente es una implementación recursiva de ss en un lenguaje
imperativo y de que retorna la solución para $C$, $k$ cuando se llama con $C,|C|,k$. ¿Cuál es su
complejidad?
```
1) subset_sum(C, i, j): // implementa ss({c1, . . . , ci}, j)

2) Si i = 0, retornar (j = 0)

3) Si no, retornar subset_sum(C, i − 1, j) ∨ subset_sum(C, i − 1, j − C[i])
```

Me convencí, luego, su complejidad es tal que

2) es $O(1)$

3) Cada subset_sum se extiende a 2 llamadas recursivas por recursión, y hay $|C|$ recursiones, luego tengo $2^(|C|)$ llamadas, cada una de tamaño $O(1)$ por lo que es $O(2^(|C|))$

#line(
  length: 100%,
  stroke: 0.5pt
)

== g) Dibujar el árbol de llamadas recursivas para la entrada $C = {6, 12, 6}$ y $k = 12$, y compararlo con el árbol de backtracking.


#image("01-g2.svg")

Podemos notar que el árbol es análogo al de backtracking.

#line(
  length: 100%,
  stroke: 0.5pt
)

== h) 
Considerar la siguiente regla de factibilidad : $p = (a_1, . . . , a_i)$ se puede extender a una solución
válida sólo si
$sum_(q=1)^i a_q c_q ≤ k$. Convencerse de que la siguiente implementación incluye la regla
de factibilidad.

```
1) subset_sum(C, i, j): // implementa ss({c1, . . . , ci}, j)
2) Si j < 0, retornar falso // regla de factibilidad
3) Si i = 0, retornar (j = 0)
4) Si no, retornar subset_sum(C, i − 1, j) ∨ subset_sum(C, i − 1, j − C[i])
```

*Rta:* Convencido $face$

#line(
  length: 100%,
  stroke: 0.5pt
)

== i) 
Definir otra regla de factibilidad, mostrando que la misma es correcta; no es necesario
implementarla.

*Sol:* Una regla de factibilidad podría ser ordenar los elementos solo guardar los $<= k$, y si el valor mínimo es mayor a $k$, no hay solución. Es trivial que esto funciona.

#line(
  length: 100%,
  stroke: 0.5pt
)

== j) 
Modificar la implementación para imprimir el subconjunto de C que suma k, si existe.
Ayuda: mantenga un vector con la solución parcial p al que se le agregan y sacan los
elementos en cada llamada recursiva; tenga en cuenta de no suponer que este vector se
copia en cada llamada recursiva, porque cambia la complejidad.

```python
def ss(C, i, j):
    if j < 0:
        return [] #Poda por factibilidad
    if i == 0:
        if j == 0:
            return [[]]
        else:
            return [] #No sol
    
    sols = ss(C, i-1, j)
    
    for sol in ss(C, i-1, j-C[i-1]):
        sols.append(sol + [C[i-1]])
    
    return sols
```