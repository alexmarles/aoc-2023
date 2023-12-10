# --- Day 10: Pipe Maze ---

def parse_map(file)
  File
    .read(file)
    .split("\n")
    .map { |l| l.split('') }
end

def find_start(grid)
  grid.each_with_index do |row, y|
    row.each_with_index do |tile, x|
      next unless tile == 'S'

      return [x, y]
    end
  end
end

def can_go_N?(x, y, grid, tile, visited)
  y.positive? && 'S|JL'.include?(tile) && '|F7'.include?(grid[y - 1][x]) && !visited.include?([x, y - 1])
end

def can_go_S?(x, y, grid, tile, visited)
  y < grid.length - 1 && 'S|F7'.include?(tile) && '|JL'.include?(grid[y + 1][x]) && !visited.include?([x, y + 1])
end

def can_go_W?(x, y, grid, tile, visited)
  x.positive? && 'S-J7'.include?(tile) && '-FL'.include?(grid[y][x - 1]) && !visited.include?([x - 1, y])
end

def can_go_E?(x, y, grid, tile, visited)
  x < grid[0].length - 1 && 'S-FL'.include?(tile) && '-J7'.include?(grid[y][x + 1]) && !visited.include?([x + 1, y])
end

def day10A(file)
  queue = []
  visited = Set.new
  grid = parse_map(file)
  start = find_start(grid)
  queue.unshift start
  visited.add start

  until queue.empty?
    x, y = queue.pop
    tile = grid[y][x]

    if can_go_N?(x, y, grid, tile, visited)
      queue.unshift [x, y - 1]
      visited.add [x, y - 1]
    end
    if can_go_S?(x, y, grid, tile, visited)
      queue.unshift [x, y + 1]
      visited.add [x, y + 1]
    end
    if can_go_W?(x, y, grid, tile, visited)
      queue.unshift [x - 1, y]
      visited.add [x - 1, y]
    end
    if can_go_E?(x, y, grid, tile, visited)
      queue.unshift [x + 1, y]
      visited.add [x + 1, y]
    end
  end
  visited.size / 2
end

def day10B(file)
  File
    .read(file)
    .split("\n")
end
