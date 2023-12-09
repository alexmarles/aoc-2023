# --- Day 9: Mirage Maintenance ---

def day09A(file)
  File
    .read(file)
    .split("\n")
    .map { |l| l.split.map(&:to_i) }
    .map do |line|
      history = [line]
      l = 1
      loop do
        history[l] = []
        history[l - 1].each_with_index do |n, i|
          history[l] << history[l - 1][i + 1] - n unless history[l - 1][i + 1].nil?
        end
        l += 1
        break if history[l - 1].map(&:zero?).all?
      end
      history.map(&:last).sum
    end
  .sum
end

def day09B(file)
  File.read(file).split("\n")
end
