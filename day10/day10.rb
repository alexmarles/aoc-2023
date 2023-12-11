# --- Day 10: Pipe Maze ---

def parse_grid(file)
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
  grid = parse_grid(file)
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
  queue = []
  visited = Set.new
  grid = parse_grid(file)
  start = find_start(grid)
  queue.unshift start
  visited.add start

  s_values = Set.new(['|', '-', 'L', 'J', 'F', '7'])

  until queue.empty?
    x, y = queue.pop
    tile = grid[y][x]

    if can_go_N?(x, y, grid, tile, visited)
      queue.unshift [x, y - 1]
      visited.add [x, y - 1]
      s_values &= Set.new(['|', 'J', 'L']) if tile == 'S'
    end
    if can_go_S?(x, y, grid, tile, visited)
      queue.unshift [x, y + 1]
      visited.add [x, y + 1]
      s_values &= Set.new(['|', 'F', '7']) if tile == 'S'
    end
    if can_go_W?(x, y, grid, tile, visited)
      queue.unshift [x - 1, y]
      visited.add [x - 1, y]
      s_values &= Set.new(['-', 'J', '7']) if tile == 'S'
    end
    next unless can_go_E?(x, y, grid, tile, visited)

    queue.unshift [x + 1, y]
    visited.add [x + 1, y]
    s_values &= Set.new(['-', 'F', 'L']) if tile == 'S'
  end
  raise 'This is wrong' unless s_values.one?

  s = s_values.first
  grid = grid.map { |row| row.map { |col| col.gsub('S', s) } }
  # Clear other pipes not in the loop
  grid = grid.map.with_index do |row, r|
    row.map.with_index do |val, c|
      visited.include?([c, r]) ? val : '.'
    end
  end

  out = Set.new

  grid.each.with_index do |row, r|
    within = false
    up = nil
    row.each.with_index do |val, c|
      if val == '|'
        raise 'This is wrong' unless up.nil?

        within = !within
      elsif val == '-'
        raise 'This is wrong' if up.nil?
      elsif 'LF'.include? val
        raise 'This is wrong' unless up.nil?

        up = val == 'L'
      elsif '7J'.include? val
        raise 'This is wrong' if up.nil?

        within = !within if val != (up ? 'J' : '7')
        up = nil
      elsif val == '.'
        # Do nothing
      else
        raise "This is unexpected: #{val}"
      end

      out.add [c, r] unless within
    end
  end

  (grid.length * grid[0].length) - (visited | out).size
end
