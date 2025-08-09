import time

n = 3
res = 0
num_magico = (n**3+n)//2

def es_magico(M):

    for fila in M:
        num_magico = (n**3+n)//2
        if sum(fila) != num_magico:
            return False
    
    for j in range(n):
        if sum(M[i][j] for i in range(n)) != num_magico:
            return False
    
    if sum(M[i][i] for i in range(n)) != num_magico:
        return False
    
    if sum(M[i][n-i-1] for i in range(n)) != num_magico:
        return False
    
    return True

def mc(M, i, j, bitmask):
    global res
    if i == n:
        if es_magico(M):
            res += 1
        return
    
    if j == n and i!=n:
        mc(M, i+1, 0, bitmask)
        return
    
    for k in range(1, n**2 + 1):
        if bitmask[k] == 0:
            M[i][j] = k
            bitmask[k] = 1
            '''
            #PODAS
            if j==n-1 and i > 0:
                if sum(M[i]) != num_magico:
                    bitmask[k] = 0
                    M[i][j] = 0
                    continue

            if i==n-1 and j > 0:
                if sum(M[l][j] for l in range(n)) != num_magico:
                    bitmask[k] = 0
                    M[i][j] = 0
                    continue'
            '''
            #Backtrack
            mc(M, i, j+1, bitmask)
            bitmask[k] = 0
            M[i][j] = 0

M = [[0 for _ in range(n)] for _ in range(n)]
bitmask = [0 for _ in range(n**2 + 1)] 

start = time.perf_counter()
mc(M, 0, 0, bitmask)
end = time.perf_counter()

print(f'Cantidad de magicuadrados de orden {n}:', res)
print(f'{end - start:.4f} segundos')
