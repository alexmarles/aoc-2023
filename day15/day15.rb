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
  boxes = Array.new(256) { Array.new 0 }
  File.read(file).strip.split(',').map do |step|
    if step.include? '-'
      label = step[..-2]
      box = $hash_fn.call(label)
      if (index = boxes[box].index { |l| l[0] == label })
        boxes[box].delete_at index
      end
    else
      label, focal = step.split('=')
      box = $hash_fn.call(label)
      focal = focal.to_i
      if (index = boxes[box].index { |l| l[0] == label })
        boxes[box][index] = [label, focal]
      else
        boxes[box] << [label, focal]
      end
    end
  end
  boxes.map.with_index(1) do |box, i|
    box.map.with_index(1) do |lens, j|
      i * j * lens[1]
    end.sum
  end.sum
end
