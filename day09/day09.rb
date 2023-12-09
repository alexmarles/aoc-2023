# --- Day 9: Mirage Maintenance ---

def history(line)
  history = [line]
  l = 1
  loop do
    history[l] = []
    history[l - 1].zip(history[l - 1].drop(1) << 0) do |a, b|
      history[l] << b - a
    end
    history[l].pop
    l += 1
    break if history[l - 1].map(&:zero?).all?
  end
  history
end

def day09A(file)
  File
    .read(file)
    .split("\n")
    .map { |l| history(l.split.map(&:to_i)) }
    .map { |l| l.map(&:last).sum }
    .sum
end

def day09B(file)
  File
    .read(file)
    .split("\n")
    .map { |l| history(l.split.map(&:to_i)) }
    .map { |l| l.map(&:first).reverse.reduce { |acc, n| n - acc } }
    .sum
end
