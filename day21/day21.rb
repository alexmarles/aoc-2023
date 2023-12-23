# --- Day 21: Step Counter ---

def get_grid(file)
  grid = File.read(file).split("\n").map { |l| l.split('') }
  sr = 0
  sc = 0
  grid.each_with_index do |row, r|
    row.each_with_index do |cell, c|
      if cell == 'S'
        sr = r
        sc = c
      end
    end
  end
  [grid, sr, sc]
end

def find_plots(grid, sr, sc, steps)
  plots = [].to_set
  seen = [[sr, sc]].to_set
  q = [[sr, sc, steps]]

  while q.any?
    r, c, s = q.shift

    plots.add [r, c] if s.even?
    next if s.zero?

    [[r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]].each do |nr, nc|
      next unless nr >= 0 && nr < grid.length

      next unless nc >= 0 && nc < grid[0].length

      next unless grid[nr][nc] != '#' && !seen.include?([nr, nc])

      seen.add [nr, nc]
      q.push [nr, nc, s - 1]
    end
  end
  plots.length
end

def day21A(file, steps)
  find_plots(*get_grid(file), steps)
end

def day21B(file, steps)
  grid, sr, sc = get_grid(file)

  raise 'Grid is not square' unless grid.length == grid[0].length

  size = grid.length

  raise 'Start is not middle' unless sr == (size / 2) && sc == (size / 2)

  raise 'This is wrong' unless (steps % size) == (size / 2)

  grid_width = (steps / size) - 1

  odd = (((grid_width / 2) * 2) + 1)**2
  even = (((grid_width + 1) / 2) * 2)**2

  odd_points = find_plots(grid, sr, sc, (size * 2) + 1)
  even_points = find_plots(grid, sr, sc, size * 2)

  corner_t = find_plots(grid, size - 1, sc, size - 1)
  corner_r = find_plots(grid, sr, 0, size - 1)
  corner_b = find_plots(grid, 0, sc, size - 1)
  corner_l = find_plots(grid, sr, size - 1, size - 1)

  small_tr = find_plots(grid, size - 1, 0, (size / 2) - 1)
  small_tl = find_plots(grid, size - 1, size - 1, (size / 2) - 1)
  small_br = find_plots(grid, 0, 0, (size / 2) - 1)
  small_bl = find_plots(grid, 0, size - 1, (size / 2) - 1)

  large_tr = find_plots(grid, size - 1, 0, ((size * 3) / 2) - 1)
  large_tl = find_plots(grid, size - 1, size - 1, ((size * 3) / 2) - 1)
  large_br = find_plots(grid, 0, 0, ((size * 3) / 2) - 1)
  large_bl = find_plots(grid, 0, size - 1, ((size * 3) / 2) - 1)

  [
    odd * odd_points,
    even * even_points,
    corner_t + corner_r + corner_b + corner_l,
    (grid_width + 1) * (small_tr + small_tl + small_br + small_bl),
    grid_width * (large_tr + large_tl + large_br + large_bl)
  ].sum
end
