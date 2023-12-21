# --- Day 21: Step Counter ---

def day21A(file, remaining)
  grid = File.read(file).split("\n").map { |l| l.split('') }
  start = []
  grid.each_with_index do |row, r|
    row.each_with_index do |cell, c|
      start = [r, c] if cell == 'S'
    end
  end

  plots = [start]

  remaining.times do
    options = []
    plots.each do |plot|
      r, c = plot
      [[0, -1], [0, 1], [-1, 0], [1, 0]].each do |dr, dc|
        nr = r + dr
        nc = c + dc

        next unless nr.positive? && nr < grid.length

        next unless nc.positive? && nc < grid[0].length

        next unless grid[nr][nc] != '#' && !options.include?([nr, nc])

        options << [nr, nc]
      end
    end
    plots = options
  end
  plots.length
end

def day21B(file)
  File.read(file).split("\n")
end
