# --- Day 2: Cube Conundrum ---

R = 12
G = 13
B = 14

R_REGEX = /(\d+)\sred/
G_REGEX = /(\d+)\sgreen/
B_REGEX = /(\d+)\sblue/

def enough_cubes?(set)
  r = set.scan(R_REGEX).flatten.first.to_i
  g = set.scan(G_REGEX).flatten.first.to_i
  b = set.scan(B_REGEX).flatten.first.to_i
  r <= R && g <= G && b <= B
end

def day02A(file)
  File
    .read(file)
    .split("\n")
    .each_with_index
    .map do |line, i|
      _, sets = line.split(': ')
      sets.split('; ').map { |set| enough_cubes? set }.all? && i + 1
    end
    .select(&:itself)
    .sum
end

def day02B(file)
  File
    .read(file)
    .split("\n")
    .map do |line|
      _, sets = line.split(': ')
      max_r, max_g, max_b = Array.new(3, 0)
      sets.split('; ').each do |set|
        max_r = [set.scan(R_REGEX).flatten[0].to_i, max_r].max
        max_g = [set.scan(G_REGEX).flatten[0].to_i, max_g].max
        max_b = [set.scan(B_REGEX).flatten[0].to_i, max_b].max
      end
      max_r * max_g * max_b
    end
    .sum
end
