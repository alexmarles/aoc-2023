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
  alm = {}
  steps = []
  File.read(file).split("\n\n").each_with_index do |l, i|
    if i.zero?
      type, nums = l.split(': ')
      nums = nums.split(' ').map(&:to_i)
      alm[type] = []
      i = 0
      while i < nums.length
        alm[type].append [nums[i], nums[i] + nums[i + 1]]
        i += 2
      end
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

  steps.each do |step| # for block in blocks
    loc = []
    match = false
    while alm['seeds'].any?
      s, e = alm['seeds'].pop
      match = false
      alm[step].each do |jump| # for abc in ranges
        jump => { dst:, src:, rng: }
        os = [s, src].max
        oe = [e, src + rng].min

        next unless os < oe

        match = true
        loc.append([os - src + dst, oe - src + dst])
        alm['seeds'].append([s, os]) if os > s
        alm['seeds'].append([oe, e]) if e > oe
        break
      end
      loc.append([s, e]) unless match
    end
    alm['seeds'] = loc
  end
  alm['seeds'].min.first
end
