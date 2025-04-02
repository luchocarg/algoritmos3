def magic_squares(n):
    size = n**2
    total = size**2
    count = 0

    def backtrack(grid, bitmask, row=0, col=0):
        nonlocal count
        if row == size:
            # Verificar si es mágico (mismo chequeo que antes)
            count += 1
            return
        
        for num in range(1, total + 1):
            mask = 1 << (num - 1)
            if not (bitmask & mask):
                # Actualizar celda y bitmask
                grid[row][col] = num
                next_row = row + (col == size-1)
                next_col = 0 if col == size-1 else col + 1
                backtrack([r.copy() for r in grid], bitmask | mask, next_row, next_col)

    backtrack([[0]*size for _ in range(size)], 0)
    return count

print(magic_squares(1))
print(magic_squares(2))