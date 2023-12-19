# --- Day 17: Clumsy Crucible ---

def day17A(file)
  grid = File
         .read(file)
         .split("\n")
         .map { |row| row.split('').map(&:to_i) }

  queue = [[0, 0, 0, 0, 0, 0]]
  visited = Set.new

  while queue
    h, r, c, dr, dc, s = queue.sort!.shift

    return h if r == grid.length - 1 && c == grid[0].length - 1

    next if visited.include? [r, c, dr, dc, s]

    visited.add([r, c, dr, dc, s])

    if s < 3 && [dr, dc] != [0, 0]
      nr = r + dr
      nc = c + dc
      if nr >= 0 && nr < grid.length && nc >= 0 && nc < grid[0].length
        nh = h + grid[nr][nc]

        queue.push [nh, nr, nc, dr, dc, s + 1]
      end
    end

    [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |ndr, ndc|
      next if [ndr, ndc] == [dr, dc] || [ndr, ndc] == [-dr, -dc]

      nr = r + ndr
      nc = c + ndc
      next unless nr >= 0 && nr < grid.length && nc >= 0 && nc < grid[0].length

      nh = h + grid[nr][nc]

      queue.push [nh, nr, nc, ndr, ndc, 1]
    end
  end
end

def day17B(file)
  File
    .read(file)
    .split("\n")
end
