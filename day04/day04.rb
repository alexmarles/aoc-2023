# --- Day 4: Scratchcards ---

def day04A(file)
  File
    .read(file)
    .split("\n")
    .map do |card|
      numbers = card.split(': ')[1]
      win, own = numbers.split(' | ').map { |list| list.split(' ') }
      common = win & own
      common.any? ? 2**(common.length - 1) : 0
    end
    .sum
end

def day04B(file)
  File
    .read(file)
    .split("\n")
end
