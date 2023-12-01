# --- Day 1: Trebuchet?! ---

WORDS = %w(one two three four five six seven eight nine)

PATTERN = /#{"(?=(#{WORDS.join('|')}|\\d))"}/

def day01A file
    data = File.read(file).split("\n")
    data.map do |line|
        nums = line.split('').reject{ |c| c.match? /[[:alpha:]]/ }
        (nums[0] + nums[-1]).to_i
    end.sum
end

def day01B file
    data = File.read(file).split("\n")
    data.map do |line|
        nums = line.scan(PATTERN).flatten.map do |x|
            WORDS.include?(x) ? (WORDS.index(x) + 1).to_s : x
        end
        (nums[0] + nums[-1]).to_i
    end.sum
end
