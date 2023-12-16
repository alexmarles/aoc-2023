# --- Day 16: The Floor Will Be Lava ---

def find_energized_cells(grid, paths)
  max_row = grid[:max_row]
  max_col = grid[:max_col]
  energized = Set.new

  until paths.empty?
    r, c, dir = paths.pop
    r += dir[0]
    c += dir[1]

    next unless r >= 0 && r <= max_row && c >= 0 && c <= max_col

    case grid[[r, c]]
    when '\\'
      dir = [dir[1], dir[0]]
      unless energized.include? [r, c, dir]
        energized.add [r, c, dir]
        paths.unshift [r, c, dir]
      end
    when '/'
      dir = [-dir[1], -dir[0]]
      unless energized.include? [r, c, dir]
        energized.add [r, c, dir]
        paths.unshift [r, c, dir]
      end
    when '|'
      if [[0, 1], [0, -1]].include? dir
        unless energized.include? [r, c, [1, 0]] # rubocop:disable Metrics/BlockNesting
          energized.add [r, c, [1, 0]]
          paths.unshift [r, c, [1, 0]]
        end
        unless energized.include? [r, c, [-1, 0]] # rubocop:disable Metrics/BlockNesting
          energized.add [r, c, [-1, 0]]
          paths.unshift [r, c, [-1, 0]]
        end
      else
        unless energized.include? [r, c, dir] # rubocop:disable Metrics/BlockNesting
          energized.add [r, c, dir]
          paths.unshift [r, c, dir]
        end
      end
    when '-'
      if [[1, 0], [-1, 0]].include? dir
        unless energized.include? [r, c, [0, 1]] # rubocop:disable Metrics/BlockNesting
          energized.add [r, c, [0, 1]]
          paths.unshift [r, c, [0, 1]]
        end
        unless energized.include? [r, c, [0, -1]] # rubocop:disable Metrics/BlockNesting
          energized.add [r, c, [0, -1]]
          paths.unshift [r, c, [0, -1]]
        end
      else
        unless energized.include? [r, c, dir] # rubocop:disable Metrics/BlockNesting
          energized.add [r, c, dir]
          paths.unshift [r, c, dir]
        end
      end
    end
    if grid[[r, c]].nil? && !(energized.include? [r, c, dir])
      energized.add [r, c, dir]
      paths.unshift [r, c, dir]
    end
  end
  energized.map { |cell| [cell[0], cell[1]] }.uniq
end

def day16A(file)
  grid = {}
  max_row = 0
  max_col = 0
  File
    .read(file)
    .split("\n")
    .map { |l| l.split('') }
    .each_with_index do |row, r|
      max_row = [max_row, r].max
      row.each_with_index do |ch, c|
        max_col = [max_col, c].max
        grid[[r, c]] = ch if ch != '.'
      end
    end
  grid[:max_row] = max_row
  grid[:max_col] = max_col
  e = find_energized_cells(grid, [[0, -1, [0, 1]]])
  e.size
end

def day16B(file)
  File
    .read(file)
    .split("\n")
end
