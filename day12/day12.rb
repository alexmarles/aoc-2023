# --- Day 12: Hot Springs ---

$pipes_cache = {}

def count_arrangements(syms, nums)
  if syms.empty?
    return nums.empty? ? 1 : 0
  end

  if nums.empty?
    return syms.include?('#') ? 0 : 1
  end

  key = [syms, nums].join '-'

  return $pipes_cache[key] if $pipes_cache.include? key

  result = 0

  result += count_arrangements(syms.drop(1), nums) if '.?'.include?(syms[0])

  if '#?'.include?(syms[0])
    enough_springs = nums[0] <= syms.length
    n_broken_springs = !syms[0..nums[0] - 1].include?('.')
    next_spring_ok = nums[0] == syms.length || syms[nums[0]] != '#'

    if enough_springs && n_broken_springs && next_spring_ok
      result += count_arrangements(syms.drop(nums[0] + 1), nums.drop(1))
    end
  end

  $pipes_cache[key] = result
  result
end

def day12A(file)
  File
    .read(file)
    .split("\n")
    .map do |l|
      syms, nums = l.split(' ')
      syms = syms.split('')
      nums = nums.split(',').map(&:to_i)
      count_arrangements(syms, nums.clone)
    end
    .sum
end

def day12B(file)
  File
    .read(file)
    .split("\n")
    .map do |l|
      syms, nums = l.split(' ')
      syms = ([syms] * 5).join('?').split('')
      nums = ([nums] * 5).join(',').split(',').map(&:to_i)
      count_arrangements(syms, nums.clone)
    end
    .sum
end
