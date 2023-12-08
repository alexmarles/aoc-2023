# --- Day 8: Haunted Wasteland ---

def day08A(file)
  graph = {}
  steps, nodes = File.read(file).split("\n\n")
  steps = steps.split('').map(&:to_sym)
  nodes.split("\n").each do |n|
    label, sides = n.split(' = ')
    sides = sides.gsub('(', '').gsub(')', '').split(', ')
    graph[label] = { L: sides[0], R: sides[1] }
  end
  i = 0
  current = 'AAA'
  while current != 'ZZZ'
    current = graph[current][steps[i % steps.length]]
    i += 1
  end
  i
end

def day08B(file)
  File
    .read(file)
    .split("\n")
end
