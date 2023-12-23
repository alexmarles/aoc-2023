# --- Day 23: A Long Walk ---

$dirs = {
  '^': [[-1, 0]],
  'v': [[1, 0]],
  '<': [[0, -1]],
  '>': [[0, 1]],
  '.': [[-1, 0], [1, 0], [0, -1], [0, 1]]
}

def valid_position(grid, r, c)
  r >= 0 && r < grid.length &&
    c >= 0 && c < grid[r].length &&
    grid[r][c] != '#'
end

def collapse_grid(grid, sr, sc, er, ec)
  points = [[sr, sc], [er, ec]]
  0.upto(grid.length - 1).each do |r|
    0.upto(grid[r].length - 1).each do |c|
      next unless valid_position(grid, r, c)

      adj = 0
      $dirs[:'.'].each do |dr, dc|
        nr = r + dr
        nc = c + dc
        next unless valid_position(grid, nr, nc)

        adj += 1
      end
      points.push([r, c]) if adj > 2
    end
  end
  graph = Hash[(points.map { |j| [j, {}] })]

  points.each do |pr, pc|
    stack = [[0, pr, pc]]
    seen = [[pr, pc]].to_set

    while stack.any?
      n, r, c = stack.pop

      if n != 0 && points.include?([r, c])
        graph[[pr, pc]][[r, c]] = n
        next
      end

      $dirs[grid[r][c].to_sym].each do |dr, dc|
        nr = r + dr
        nc = c + dc
        next unless nr >= 0 && nr < grid.length
        next unless nc >= 0 && nc < grid.length
        next unless grid[nr][nc] != '#'
        next if seen.include?([nr, nc])

        stack.push [n + 1, nr, nc]
        seen.add [nr, nc]
      end
    end
  end
  graph
end

def dfs(graph, node, end_node, visited)
  return 0 if node == end_node

  max_cost = -Float::INFINITY

  visited.add node
  graph[node].each do |adj, n|
    unless visited.include? adj
      trail_cost = n + dfs(graph, adj, end_node, visited)
      max_cost = [max_cost, trail_cost].max
    end
  end
  visited.delete node
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

  graph = collapse_grid(grid, sr, sc, er, ec)
  dfs(graph, [sr, sc], [er, ec], Set.new)
end

def day23B(file)
  grid = File
         .read(file)
         .split("\n")
         .map { |l| l.gsub(/[\^v><]/, '.').split('') }
  sr = 0
  sc = grid[sr].index('.')
  er = grid.length - 1
  ec = grid[er].index('.')

  graph = collapse_grid(grid, sr, sc, er, ec)
  dfs(graph, [sr, sc], [er, ec], Set.new)
end
