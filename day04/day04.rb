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
  cards = {}
  File
    .read(file)
    .split("\n")
    .each_with_index do |card, i|
      cards[i] ? cards[i] += 1 : cards[i] = 1
      numbers = card.split(': ')[1]
      win, own = numbers.split(' | ').map { |list| list.split(' ') }
      common = win & own
      cards[i].times do
        common.length.times do |j|
          nci = i + j + 1
          cards[nci] ? cards[nci] += 1 : cards[nci] = 1
        end
      end
    end
  cards.values.sum
end
