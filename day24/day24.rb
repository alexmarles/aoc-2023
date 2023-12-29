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

      collisions.push [hs1, hs2] # Hailstones intersect
    end
  end
  collisions.count
end

def day24B(file)
  hails = File
          .read(file)
          .split("\n")
          .map { |line| Hailstone.new(line.split(' @ ').map { |side| side.split(', ').map(&:to_i) }) }

  # xh + t * vxh = xr + t * vxr
  # ->
  # t * vxh - t * vxr = xr - xh
  # ->
  # t = (xr - xh) / (vxh - vxr) = (yr - yh) / (vyh - vyr) = (zr - zh) / (vzh - vzr)
  # ->
  # (xr - h1sx) * (h1vy - vyr) = (yr - h1sy) * (h1vx - vxr)
  # (yr - h1sy) * (h1vz - vzr) = (zr - h1sz) * (h1vy - vyr)
  # (xr - h2sx) * (h2vy - vyr) = (yr - h2sy) * (h2vx - vxr)
  # (yr - h2sy) * (h2vz - vzr) = (zr - h2sz) * (h2vy - vyr)
  # (xr - h3sx) * (h3vy - vyr) = (yr - h3sy) * (h3vx - vxr)
  # (yr - h3sy) * (h3vz - vzr) = (zr - h3sz) * (h3vy - vyr)

  # Print system of equations and solve it using MATLAB
  puts "\n"
  puts 'syms xr yr zr vxr vyr vzr'
  hails[0..2].each_with_index do |h, i|
    puts "eq#{i * 2 + 1} = (xr - #{h.sx}) * (#{h.vy} - vyr) == (yr - #{h.sy}) * (#{h.vx} - vxr)"
    puts "eq#{i * 2 + 2} = (yr - #{h.sy}) * (#{h.vz} - vzr) == (zr - #{h.sz}) * (#{h.vy} - vyr)"
  end
  puts 'sol = solve([eq1, eq2, eq3, eq4, eq5, eq6], [xr, yr, zr, vxr, vyr, vzr])'
  puts 'sol.xr + sol.yr + sol.zr'
  puts 'ans(1)'
end
