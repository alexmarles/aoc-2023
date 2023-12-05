# --- Day 5: If You Give A Seed A Fertilizer ---

def day05A(file)
  seeds, *steps = File.read(file).split("\n\n")
  seeds
    .split(': ')[1]
    .split
    .map(&:to_i)
    .map do |seed|
    steps.each do |step|
      step
        .split(" map:\n")[1]
        .split("\n")
        .map { |range| range.split.map(&:to_i) }
        .each do |dst, src, rng|
          next unless (src..(src + rng - 1)).include?(seed)

          seed = dst + seed - src
          break
        end
    end
    seed
  end.min
end

def day05B(file)
  seeds, *steps = File.read(file).split("\n\n")
  seeds = seeds
          .split(': ')[1]
          .split
          .map(&:to_i)
          .each_slice(2)
          .map { |seed| [seed[0], seed[0] + seed[1]] }

  steps.each do |step|
    loc = []
    match = false
    while seeds.any?
      s, e = seeds.pop
      match = false
      step
        .split(" map:\n")[1]
        .split("\n")
        .map { |range| range.split.map(&:to_i) }
        .each do |dst, src, rng|
          os = [s, src].max
          oe = [e, src + rng].min

          next unless os < oe

          loc.append([os - src + dst, oe - src + dst])
          seeds.append([s, os]) if os > s
          seeds.append([oe, e]) if e > oe
          match = true
          break
        end
      loc.append([s, e]) unless match
    end
    seeds = loc
  end
  seeds.min.first
end
