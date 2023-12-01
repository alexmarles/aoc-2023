# --- Day 1: Trebuchet?! ---

def day01A file
    data = File.read(file).split("\n")
    data.map do |line|
        nums = line.split('').reject{ |c| c.match? /[[:alpha:]]/ }
        (nums[0] + nums[-1]).to_i
    end.sum
end

def day01B file
end
