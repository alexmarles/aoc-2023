# --- Day 14: Parabolic Reflector Dish ---

def tilt(platform)
  platform.transpose.map do |row|
    sorted = row.join.split('#').map do |group|
      group.split('').sort.reverse.join('')
    end.join('#').split('')
    sorted.fill('#', sorted.length..(platform.length - 1))
  end.transpose
end

def day14A(file)
  platform = File.read(file).split("\n").map { |l| l.split('') }
  tilt(platform)
    .map.with_index do |row, i|
      row.count('O') * (platform.length - i)
    end.sum
end

def day14B(file)
  one_b = 1_000_000_000
  pf = File.read(file).split("\n").map { |l| l.split('') }
  cycle = lambda do
    pf = tilt(pf) # Tilt N
    pf = tilt(pf.transpose).transpose # Tilt W
    pf = tilt(pf.reverse).reverse # Tilt S
    pf = tilt(pf.transpose.reverse).reverse.transpose # Tilt E
  end
  history = Set.new
  history.add pf
  batch = [pf]

  iterations = nil
  one_b.times do |i|
    iterations = i
    cycle.call
    break if history.include? pf

    history.add pf
    batch << pf
  end
  start = batch.index(pf)
  pf = batch[(one_b - start) % (iterations + 1 - start) + start]

  pf.map.with_index do |row, i|
    row.count('O') * (pf.length - i)
  end.sum
end
