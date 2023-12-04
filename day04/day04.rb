# --- Day 4: Scratchcards ---

def day04A(file)
  File.read(file).split("\n").map do |card|
    win, own = card
               .split(': ')[1]
               .split(' | ')
               .map { |list| list.split(' ') }
    common = win & own
    common.any? ? 2**(common.length - 1) : 0
  end
  .sum
end

def day04B(file)
  cards = {}
  File.read(file).split("\n").each_with_index do |card, i|
    cards[i] = 1 unless cards[i]
    win, own = card
               .split(': ')[1]
               .split(' | ')
               .map { |list| list.split(' ') }
    winning = (win & own).length
    ((i + 1)..(i + winning)).each do |next_card|
      cards[next_card] = (cards[next_card] || 1) + cards[i]
    end
  end
  cards.values.sum
end
