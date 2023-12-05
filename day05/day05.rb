# --- Day 5: If You Give A Seed A Fertilizer ---

def day05A(file)
  alm = {}
  steps = []
  File.read(file).split("\n\n").each_with_index do |l, i|
    if i.zero?
      type, nums = l.split(': ')
      alm[type] = nums.split(' ').map(&:to_i)
      next
    end

    type, nums = l.split(" map:\n")
    alm[type] = []
    steps << type
    nums.split("\n").each do |n|
      dst, src, rng = n.split(' ').map(&:to_i)
      alm[type] << { dst:, src:, rng: }
    end
  end
  alm['seeds'].map do |seed|
    val = seed
    steps.each do |step|
      alm[step].each do |jump|
        jump => { dst:, src:, rng: }
        next unless (src..(src + rng - 1)).include?(val)

        val = dst + val - src
        break
      end
    end
    val
  end
  .min
end

def day05B(file)
  File.read(file).split("\n")
end
