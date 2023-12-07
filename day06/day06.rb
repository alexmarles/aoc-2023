# --- Day 6: Wait For It ---

def day06A(file)
  ts, ds = File
           .read(file)
           .split("\n")
           .map do |l|
             l.split(/:\s+/)[1]
              .split
              .map(&:to_i)
           end
  ts.map.with_index do |t, i|
    t.times.map { |bt| ((t - bt) * bt) > ds[i] ? 1 : 0 }.sum
  end
  .inject(:*)
end

def day06B(file)
  t, d = File
         .read(file)
         .split("\n")
         .map do |l|
           l.scan(/\d+\s*/).join.delete(' ').to_i
         end
  t.times.map { |bt| ((t - bt) * bt) > d ? 1 : 0 }.sum
end
