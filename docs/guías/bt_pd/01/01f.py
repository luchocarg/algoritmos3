def ss(C, i, j):
    if j < 0:
        return []
    if i == 0:
        if j == 0:
            return [[]] 
        else:
            return []
    
    sols = ss(C, i-1, j)
    
    for sol in ss(C, i-1, j-C[i-1]):
        sols.append(sol + [C[i-1]])
    
    return sols