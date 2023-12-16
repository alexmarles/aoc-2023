# --- Day 14: Parabolic Reflector Dish ---

def day14A(file)
  platform = File.read(file).split("\n").map { |l| l.split('') }
  max_rows = platform.length
  tilted = Set.new
  platform.each_with_index do |row, r|
    row.each_with_index do |cell, c|
      next unless cell == 'O'

      nr = r
      nr -= 1 while nr.positive? && !tilted.include?([nr - 1, c]) && platform[nr - 1][c] != '#'
      tilted.add [nr, c]
    end
  end
  tilted.map { |rock| max_rows - rock[0] }.sum
end

def day14B(file)
  File
    .read(file)
    .split("\n")
end
