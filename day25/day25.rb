# --- Day 25: Snowverload ---

def day25A(file)
  vertices = Set.new
  edges = Set.new
  subsets = Set.new
  File
    .readlines(file)
    .each do |line|
      left, *right = line.gsub(':', ' ').split
      vertices |= [left, *right].to_set
      edges |= right.map { |r| [left, r] }.to_set
    end

  find_subset = lambda do |v|
    subsets.find { |s| s.include?(v) }
  end

  loop do
    subsets = vertices.map { |v| [v].to_set }.to_a

    while subsets.length > 2
      s1, s2 = edges.to_a.sample.map { |s| find_subset.call(s) || s }
      if s1 != s2
        s1.merge s2
        subsets.delete s2
      end
    end
    break if edges.count { |u, v| find_subset.call(u) != find_subset.call(v) } < 4
  end
  subsets.map(&:length).inject(&:*)
end
