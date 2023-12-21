# --- Day 21: Step Counter ---

def day21A(file, steps)
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

  plots = [].to_set
  seen = [[sr, sc]].to_set
  q = [[sr, sc, steps]]

  while q.any?
    r, c, s = q.shift

    plots.add [r, c] if s.even?
    next if s.zero?

    [[r, c - 1], [r, c + 1], [r - 1, c], [r + 1, c]].each do |nr, nc|
      next unless nr.positive? && nr < grid.length

      next unless nc.positive? && nc < grid[nr].length

      next unless grid[nr][nc] != '#' && !seen.include?([nr, nc])

      seen.add [nr, nc]
      q.push [nr, nc, s - 1]
    end
  end
  plots.length
end

def day21B(file)
  File.read(file).split("\n")
end
