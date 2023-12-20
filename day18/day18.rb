# --- Day 18: Lavaduct Lagoon ---

def day18A(file)
  dirs = { 'R': [0, 1], 'L': [0, -1], 'U': [-1, 0], 'D': [1, 0] }
  trench = Set.new [[0, 0]]
  r = 0
  c = 0
  File
    .read(file)
    .split("\n")
    .map { |row| row.split(' ') }
    .each do |dir, steps, _color|
      dr, dc = dirs[dir.to_sym]
      steps = steps.to_i
      steps.times do
        r += dr
        c += dc
        trench.add [r, c]
      end
    end

  trench = trench.to_a
  area = (0..trench.length - 1).map do |i|
    trench[i][0] * (trench[i - 1][1] - trench[(i + 1) % trench.length][1])
  end.sum.abs / 2
  boundary = trench.length
  area - boundary / 2 + 1 + boundary
end

def day18B(file)
  File
    .read(file)
    .split("\n")
end
