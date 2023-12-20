# --- Day 18: Lavaduct Lagoon ---

def dig_a_trench(file, swap: false)
  dirs = { 'R': [0, 1], 'L': [0, -1], 'U': [-1, 0], 'D': [1, 0] }
  trench = [[0, 0]]
  boundary = 0
  File
    .read(file)
    .split("\n")
    .map { |row| row.split(' ') }
    .each do |dir, steps, color|
      if swap
        hex = color.match(/\#([a-z0-9]{6})/)[1]
        dr, dc = dirs['RDLU'[hex[-1].to_i].to_sym]
        steps = hex[..-2].to_i 16
      else
        dr, dc = dirs[dir.to_sym]
        steps = steps.to_i
      end
      boundary += steps
      r, c = trench[-1]
      trench << [r + dr * steps, c + dc * steps]
    end
  [trench, boundary]
end

def day18A(file)
  trench, boundary = dig_a_trench(file).to_a
  area = (0..trench.length - 1).map do |i|
    trench[i][0] * (trench[i - 1][1] - trench[(i + 1) % trench.length][1])
  end.sum.abs / 2
  area - boundary / 2 + 1 + boundary
end

def day18B(file)
  trench, boundary = dig_a_trench(file, swap: true).to_a
  area = (0..trench.length - 1).map do |i|
    trench[i][0] * (trench[i - 1][1] - trench[(i + 1) % trench.length][1])
  end.sum.abs / 2
  area - boundary / 2 + 1 + boundary
end
