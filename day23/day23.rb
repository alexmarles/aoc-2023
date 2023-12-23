# --- Day 23: A Long Walk ---

def valid_position(grid, r, c)
  r >= 0 && r < grid.length &&
    c >= 0 && c < grid[r].length &&
    grid[r][c] != '#' &&
    grid[r][c] != 'E'
end

def dfs(grid, r, c, visited, trails)
  return trails[[r, c]] || 0 if visited.include? [r, c]

  visited.push [r, c]
  max_cost = 1

  [[r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]].each do |nr, nc|
    next unless valid_position(grid, nr, nc)
    next if visited.include?([nr, nc])

    cost = 1
    case grid[nr][nc]
    when '>'
      nc += 1
      cost += 1
    when '<'
      nc -= 1
      cost += 1
    when 'v'
      nr += 1
      cost += 1
    when '^'
      nr -= 1
      cost += 1
    end

    path_cost = cost + dfs(grid, nr, nc, visited, trails)
    max_cost = [max_cost, path_cost].max
  end
  trails[[r, c]] = max_cost
  max_cost
end

def day23A(file)
  grid = File
         .read(file)
         .split("\n")
         .map { |l| l.split('') }
  sr = 0
  sc = grid[sr].index('.')
  er = grid.length - 1
  ec = grid[er].index('.')
  grid[sr][sc] = 'S'
  grid[er][ec] = 'E'

  trails = {}
  dfs(grid, sr, sc, [], trails)
  trails.values.max
end

def day23B(file)
  File
    .read(file)
    .split("\n")
end
