# --- Day 7: Camel Cards ---

def type_of_hand(hand, joker)
  if joker
    m_c_c = hand.split('').max_by { |c| c == 'J' ? 0 : hand.count(c) }
    hand.gsub!('J', m_c_c)
  end
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

def map_letters(card, joker)
  {
    T: 'A',
    J: joker ? '1' : 'B',
    Q: 'C',
    K: 'D',
    A: 'E'
  }[card.to_sym] || card
end

def strength(play, joker: false)
  [
    type_of_hand(play[:hand].clone, joker),
    play[:hand].split('').map { |card| map_letters(card, joker) }
  ]
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
  File
    .read(file)
    .split("\n")
    .map(&:split)
    .map { |hand, bid| { hand:, bid: bid.to_i } }
    .sort_by { |play| strength(play, joker: true) }
    .map.with_index { |play, i| play[:bid] * (i + 1) }.sum
end
