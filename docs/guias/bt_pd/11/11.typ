#image("image.png")

$
  "os"_(v w) (i,s) = cases(
    [" "] &"si" i = n and s = w,
    bot &"si" (i = n and s != w) or (s>w),
    prec cases(
      "os"_(v w) (i+1, s+v_(i+1)) &circle.stroked.small [+],
      "os"_(v w) (i+1, s dot v_(i+1)) &circle.stroked.small [times],
      "os"_(v w) (i+1, s^(v_(i+1))) &circle.stroked.small [arrow.t],
    ) &"sino"
  )  
$

#align(center)[Con $prec$ tal que devuelve cualquier lista diferente de $bot$]

#image("image-1.png")

```typc
f solve(v,w):

  memo = matriz de n*w

  f os(i,s):
    
    si (i = n and s = w) or (s > w):
      return None

    si i = n and i = w:
      return []
      
    si memo[i][s] != None:
      return memo[i][s]
 
    //prec retorna cualquiera de los 3 si es distinto de None
    memo[i][s] = prec(os(i+1,s+v[i+1])++[+],
                      os(i+1,s*v[i+1])++[x],
                      os(i+1,s^v[i+1])++[↑])
    
    return memo[i][s]

solve(1,v[1])
```

```
Para cada k en 1...n:
    Para cada par de nodos (i, j):
        Actualizar caminos que usan k como intermedio:
        
        c_pares = par[i][k] * par[k][j] + impar[i][k] * impar[k][j]
        c_impares = par[i][k] * impar[k][j] + impar[i][k] * par[k][j]
        
        par[i][j] += c_pares
        impar[i][j] += c_impares
```