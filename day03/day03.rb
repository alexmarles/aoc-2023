# --- Day 3: Gear Ratios ---

SYM_REGEX = %r{[*\-$=+&@#/%]}
GEAR_REGEX = /\*/

def gather_parts(file, syms_regex)
  parts = []
  syms = []
  File
    .read(file)
    .split("\n")
    .each_with_index do |line, i|
      line.scan(/\d+/) do |n|
        parts << [
          n.to_i,
          [$LAST_MATCH_INFO.offset(0)[0], i],
          [$LAST_MATCH_INFO.offset(0)[0] + n.length - 1, i]
        ]
      end
      line.scan(syms_regex) do |s|
        syms << [s, [$LAST_MATCH_INFO.offset(0)[0], i]]
      end
    end
  [parts, syms]
end

def adjacent?(p, s)
  h = p[0] == s[0] && (p[1] - s[1]).abs == 1
  v = p[1] == s[1] && (p[0] - s[0]).abs == 1
  d = (p[0] - s[0]).abs == 1 && (p[1] - s[1]).abs == 1
  [h, v, d].any?
end

def adjacent_symbol?(part, syms)
  (part[1][0]..part[2][0]).map do |x|
    syms.map { |symbol| adjacent?([x, part[1][1]], symbol[1]) }.any?
  end.any?
end

def gear_adjacent_parts(gear, parts)
  parts
    .select { |part| adjacent_symbol?(part, [gear]) }
    .map { |part| part[0] }
end

def day03A(file)
  parts, syms = gather_parts(file, SYM_REGEX)
  parts.map do |part|
    part[0] if adjacent_symbol?(part, syms)
  end
  .select(&:itself)
  .sum
end

def day03B(file)
  parts, gears = gather_parts(file, GEAR_REGEX)
  gears.map do |gear|
    adjacents = gear_adjacent_parts(gear, parts)
    adjacents.length > 1 ? adjacents.inject(:*) : 0
  end
  .sum
end
