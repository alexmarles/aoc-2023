# --- Day 15: Lens Library ---

$hash_fn = lambda do |word|
  word.each_byte.reduce(0) do |acc, byte|
    ((acc + byte) * 17) % 256
  end
end

def day15A(file)
  File.read(file).strip.split(',').map(&$hash_fn).sum
end

def day15B(file)
  File.read(file).split("\n").map { |l| l.split('') }
end
