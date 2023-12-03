# --- Day 3: Gear Ratios ---

SYM_REGEX = %r{[*\-$=+&@#/%]}

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

def day03A(file)
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
      line.scan(SYM_REGEX) do |s|
        syms << [s, [$LAST_MATCH_INFO.offset(0)[0], i]]
      end
    end
  parts.map do |part|
    part[0] if adjacent_symbol?(part, syms)
  end
  .select(&:itself)
  .sum
end

def day03B(file)
  File
    .read(file)
    .split("\n")
end
