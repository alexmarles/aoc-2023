# --- Day 22: Sand Slabs ---

def day22A(file)
  overlaps = lambda do |a, b|
    [a[0][0], b[0][0]].max <= [a[1][0], b[1][0]].min && [a[0][1], b[0][1]].max <= [a[1][1], b[1][1]].min
  end

  bricks = File
           .read(file)
           .split("\n")
           .map { |l| l.split('~').map { |c| c.split(',').map(&:to_i) } }
           .sort_by { |b| b[0][2] }
  bricks.each_with_index do |brick, index|
    max_z = 1
    bricks[...index].each do |check|
      max_z = [max_z, check[1][2] + 1].max if overlaps.call(brick, check)
    end
    brick[1][2] -= brick[0][2] - max_z
    brick[0][2] = max_z
  end
  bricks.sort_by { |b| b[0][2] }

  a_supports_b = Hash[(0...bricks.length).to_a.map { |i| [i, Set.new] }]
  b_supports_a = Hash[(0...bricks.length).to_a.map { |i| [i, Set.new] }]

  bricks.each_with_index do |upper, j|
    bricks[...j].each_with_index do |lower, i|
      if overlaps.call(lower, upper) && upper[0][2] == lower[1][2] + 1
        a_supports_b[i].add j
        b_supports_a[j].add i
      end
    end
  end

  bricks.length.times.map do |i|
    a_supports_b[i].map { |j| b_supports_a[j].length >= 2 }.all?
  end.select(&:itself).count
end

def day22B(file)
  File
    .read(file)
    .split("\n")
end
