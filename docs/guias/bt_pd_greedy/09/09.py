def solve(A, n, m):
    memo = [float('inf')] * min(n, m)

    if n >= m:
        for i in range(n-1, -1, -1):
            for j in range(m-1, -1, -1):
                if i == n-1 and j == m-1:
                    memo[j] = max(1, 1 - A[i][j])
                else:
                    memo[j] = max(1, min(memo[j], memo[j+1] if j+1 < m else float('inf')) - A[i][j])
    else:
        for j in range(m-1, -1, -1):
            for i in range(n-1, -1, -1):
                if i == n-1 and j == m-1:
                    memo[i] = max(1, 1 - A[i][j])
                else:
                    memo[i] = max(1, min(memo[i], memo[i+1] if i+1 < n else float('inf')) - A[i][j])

    return memo[0]

A = [
    [-2, -3, 3],
    [-5, -10, 1],
    [10, 30, -5]
]

n = 3
m = 3

print(solve(A, n, m))
