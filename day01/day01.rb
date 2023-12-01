# --- Day 1: Trebuchet?! ---

WORDS = %w[one two three four five six seven eight nine]

PATTERN = /#{"(?=(#{WORDS.join('|')}|\\d))"}/

def day01A(file)
  File
    .read(file)
    .split("\n")
    .map do |line|
      nums = line.split('').reject { |c| c.match?(/[[:alpha:]]/) }
      (nums[0] + nums[-1]).to_i
    end
    .sum
end

def day01B(file)
  File
    .read(file)
    .split("\n")
    .map do |line|
      nums = line.scan(PATTERN).flatten.map { |x| WORDS.include?(x) ? (WORDS.index(x) + 1).to_s : x }
      (nums[0] + nums[-1]).to_i
    end
    .sum
end
