# --- Day 11: Cosmic Expansion ---

def map_universe(file)
  galaxies = []
  empty_rows = []
  empty_cols = []
  universe = File.read(file).split("\n").map { |row| row.split('') }
  universe
    .each_with_index do |row, r|
      if row.uniq == ['.']
        empty_rows << (r + empty_rows.length) # Previous expanded rows offset
        next
      end
      row.each_with_index do |val, c|
        galaxies << [r, c] if val == '#'
      end
    end

  universe
    .transpose
    .each_with_index do |col, c|
      next if col.uniq != ['.']

      empty_cols << (c + empty_cols.length) # Previous expanded cols offset
    end

  empty_rows.each do |r|
    galaxies.map! { |g| r < g[0] ? [g[0] + 1, g[1]] : g }
  end

  empty_cols.each do |c|
    galaxies.map! { |g| c < g[1] ? [g[0], g[1] + 1] : g }
  end

  galaxies
end

def distance_between(pair)
  a, b = pair
  (b[1] - a[1]).abs + (b[0] - a[0]).abs
end

def day11A(file)
  map_universe(file)
    .combination(2)
    .to_a
    .map do |pair|
      distance_between pair
    end
    .sum
end

def day11B(file)
  File
    .read(file)
    .split("\n")
end
