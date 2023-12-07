# --- Day 7: Camel Cards ---

def type_of_hand(hand)
  [
    [1, 1, 1, 1, 1],  # High card
    [1, 1, 1, 2],     # One pair
    [1, 2, 2],        # Two pair
    [1, 1, 3],        # Three of a kind
    [2, 3],           # Full house
    [1, 4],           # Four of a kind
    [5]               # Five of a kind
  ].index(hand.split('').uniq.map { |l| hand.count(l) }.sort)
end

def map_letters(card)
  { T: 'A', J: 'B', Q: 'C', K: 'D', A: 'E' }[card.to_sym] || card
end

def strength(play)
  [type_of_hand(play[:hand]), play[:hand].split('').map { |card| map_letters(card) }]
end

def day07A(file)
  File
    .read(file)
    .split("\n")
    .map(&:split)
    .map { |hand, bid| { hand:, bid: bid.to_i } }
    .sort_by { |play| strength(play) }
    .map.with_index { |play, i| play[:bid] * (i + 1) }
    .sum
end

def day07B(file)
  File.read(file).split("\n")
end
