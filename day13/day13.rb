# --- Day 13: Point of Incidence ---

def find_mirror(pattern)
  (1..pattern.length - 1).each do |i|
    top = pattern[..i - 1].reverse
    bottom = pattern[i..]

    top = top[..bottom.length - 1]
    bottom = bottom[..top.length - 1]

    return i if top == bottom
  end
  0
end

def day13A(file)
  File
    .read(file)
    .split("\n\n")
    .map do |pattern|
      pattern = pattern.split("\n").map { |l| l.split('') }
      rows = find_mirror(pattern.clone)
      cols = find_mirror(pattern.transpose.clone)
      (rows * 100) + cols
    end
    .sum
end

def day13B(file)
  File
    .read(file)
    .split("\n")
end
