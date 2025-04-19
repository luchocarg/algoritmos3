#image("image.png")

= a

$
  d(w) = cases(
    0 &"si" w = v,
    min_((z->w) in E) (d(z)+c(z->w)) &"sino"
  )
$

= b

```
pred = [[]*n]
para cada (u,v) en E(D): //O(m)
  pred[v].add(u)

memo = [null]*n
f rec(w):
  si w ≡ v:
    ret 0

  si memo[w] es null:
    memo[w] = min(d(z)+c(z,w) para cada z en pred[w]) //O(n) acotado por estados

  return memo[w]

  //O(n+m)
```

= c

```
ady = lista de adyacencias de E 

ord = reverse(dfs(v,E)) //toposort O(n+m)

memo [[null]*n]
memo[v] = 0

para u en ord: //O(n)
  para z in ady[u]: //O(d(u))
    memo[z] = min(memo[z],memo[u]+c(u,z))

ret memo[w]


//O(n+m)
```