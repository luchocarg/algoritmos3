def bt(M, i, j, n, res):
    if i==n and j==n:
        for i in range(n):
            

    for k in range(0,n**2):
        if j == n and i != n:
            M[i][j] = k
            return bt(M, i+1, 1, n,res)
        else:
            M[i][j] = k
            return bt(M, i, j+1, n,res)

n=3
M = [[0 for _ in range(n)] for _ in range(n)]

#bt(M,0,0,n-1, 0)