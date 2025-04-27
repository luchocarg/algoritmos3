#image("image.png")


```typc
f is_FW(M)

  for i in 1...n:
    for j in 1...n:
        if M[i][j] != M[j][i]:
            return False, (i,j)

  for k in range 1...n:
    for i in range 1...n:
      for j in range 1...n:
        si M[i][j] > M[i][k]+d[k][j]: 
          return False, (i,k,j)

  return True, Null

f solve(M):
  es_fw, data = is_FW(M)  

  si no es_fw:
    return data

  M' = copia de M

  for k in range 1...n:
    for i in range 1...n:
      for j in range 1...n:
        si M[i][j] ≥ M[i][k]+d[k][j] and k!=i!=j:
          M'[i][j] = inf
          M'[j][i] = inf

  return M'
```
