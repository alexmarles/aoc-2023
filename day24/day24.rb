# --- Day 24: Never Tell Me The Odds ---

class Hailstone
  attr_accessor :sx, :sy, :sz, :vx, :vy, :vz, :a, :b, :c

  def initialize(hailstone)
    @sx, @sy, @sz = hailstone[0]
    @vx, @vy, @vz = hailstone[1]

    # From
    # px = x + t * vx
    # py = y + t * vy
    # ->
    # (px - x) / vx = (py - y) / vy
    # ->
    # vy * (px - x) = vx * (py - y)
    # ->
    # vy * px - vy * x = vx * py - vx * y
    # ->
    # vy * px - vx * py = vy * x - vx * y

    # Standard form of ax + by = c
    @a = @vy
    @b = -@vx
    @c = @vy * @sx - @vx * @sy
  end
end

def day24A(file, min, max)
  area = (min...max)
  hails = File
          .read(file)
          .split("\n")
          .map { |line| Hailstone.new(line.split(' @ ').map { |side| side.split(', ').map(&:to_i) }) }

  collisions = []
  hails.each_with_index do |hs1, i|
    hails[i + 1..].each do |hs2|
      next if hs1.a * hs2.b == hs1.b * hs2.a # Hailstones are parallel

      # From system
      # a1x + b1y = c1 }
      # a2x + b2y = c2 }
      # x = (c1 * b2 - c2 * b1) / (a1 * b2 - a2 * b1)
      # y = (c2 * a1 - c1 * a2) / (a1 * b2 - a2 * b1)
      x = (hs1.c * hs2.b - hs2.c * hs1.b) / (hs1.a * hs2.b - hs2.a * hs1.b)
      y = (hs2.c * hs1.a - hs1.c * hs2.a) / (hs1.a * hs2.b - hs2.a * hs1.b)

      next unless area.include?(x) && area.include?(y) # Not in the test area
      next unless [hs1, hs2].map { |hs| (x - hs.sx) * hs.vx >= 0 && (y - hs.sy) * hs.vy >= 0 }.all? # Not in the past

      collisions.push [hs1, hs2]
    end
  end
  collisions.count
end

def day24B(file)
  File
    .read(file)
    .split("\n")
    .map { |l| l.split('') }
end
