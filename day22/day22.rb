# --- Day 22: Sand Slabs ---

def overlaps(a, b)
  [a[0][0], b[0][0]].max <= [a[1][0], b[1][0]].min && [a[0][1], b[0][1]].max <= [a[1][1], b[1][1]].min
end

def stack_bricks(file)
  bricks = File
           .read(file)
           .split("\n")
           .map { |l| l.split('~').map { |c| c.split(',').map(&:to_i) } }
           .sort_by { |b| b[0][2] }
  bricks.each_with_index do |brick, index|
    max_z = 1
    bricks[...index].each do |check|
      max_z = [max_z, check[1][2] + 1].max if overlaps(brick, check)
    end
    brick[1][2] -= brick[0][2] - max_z
    brick[0][2] = max_z
  end
  bricks.sort_by { |b| b[0][2] }
end

def get_supports(bricks)
  supports = Hash[(0...bricks.length).to_a.map { |i| [i, Set.new] }]
  supported_by = Hash[(0...bricks.length).to_a.map { |i| [i, Set.new] }]

  bricks.each_with_index do |upper, j|
    bricks[...j].each_with_index do |lower, i|
      if overlaps(lower, upper) && upper[0][2] == lower[1][2] + 1
        supports[i].add j
        supported_by[j].add i
      end
    end
  end
  [supports, supported_by]
end

def day22A(file)
  bricks = stack_bricks(file)
  supports, supported_by = get_supports(bricks)

  bricks.length.times.map do |i|
    supports[i].map { |j| supported_by[j].length >= 2 }.all?
  end.select(&:itself).count
end

def day22B(file)
  bricks = stack_bricks(file)
  supports, supported_by = get_supports(bricks)

  fallen = []
  bricks.length.times.map do |i|
    queue = supports[i].select { |lower| supported_by[lower].length == 1 }
    will_fall = queue.to_set

    while queue.any?
      upper = queue.shift
      (supports[upper] - will_fall).each do |brick| # Set substraction
        if supported_by[brick] <= will_fall # Subset of
          will_fall.add brick
          queue.push brick
        end
      end
    end
    fallen << will_fall.to_a
  end
  fallen.map(&:count).sum
end
