"""
f solve(A, n, m):

  si n>=m:
    pred = [inf]*n
    actual = [inf]*n
    actual[n] = 1
    para cada i en n...1:
      para cada j en m...1:
        actual[i] = max(1,min(pred[i],actual[i+1]) - A[i][j])

      pred = actual

  sino:
    
    pred = [inf]*m
    actual = [inf]*m

    actual[m] = 1

    para cada j en m...1:
      para cada i en n...1:
        actual = max(1,min(pred[j],actual[j+1]) - A[i][j])

    pred = actual
  ret memo[1]
"""

def solve(A, n, m):
  if n < m:
      A = list(zip(*A))
      n, m = m, n

  memo = [float('inf')]*(m+1)
  memo[m-1] = 1

  for i in reversed(range(n)):
      for j in reversed(range(m)):
          memo[j] = max(1, min(memo[j],memo[j+1]) - A[i][j])

  return memo[0]

A = [
    [-2, -3, 3],
    [-5, -10, 1],
    [10, 30, -5]
]

n = 3
m = 3

print(solve(A, n, m))
