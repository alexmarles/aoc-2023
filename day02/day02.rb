# --- Day 2: Cube Conundrum ---

CONFIG = {
  red: 12,
  green: 13,
  blue: 14
}

RED_REGEX = /(\d+)\sred/
BLUE_REGEX = /(\d+)\sblue/
GREEN_REGEX = /(\d+)\sgreen/

def day02A(file)
  File
    .read(file)
    .split("\n")
    .map do |line|
      game, sets = line.split(':')
      ok = true
      sets.split(';').each do |set|
        count_red = set.scan(RED_REGEX).flatten[0].to_i
        count_green = set.scan(GREEN_REGEX).flatten[0].to_i
        count_blue = set.scan(BLUE_REGEX).flatten[0].to_i
        ok = count_red <= CONFIG[:red] && count_green <= CONFIG[:green] && count_blue <= CONFIG[:blue]
        break unless ok
      end
      ok && game.split(' ')[1].to_i
    end
    .select(&:itself)
    .sum
end

def day02B(file)
  File
    .read(file)
    .split("\n")
    .map do |line|
      max_cubes = {
        red: 0,
        green: 0,
        blue: 0
      }
      line
        .split(':')[1]
        .split(';').each do |set|
          max_cubes[:red] = [set.scan(RED_REGEX).flatten[0].to_i, max_cubes[:red]].max
          max_cubes[:green] = [set.scan(GREEN_REGEX).flatten[0].to_i, max_cubes[:green]].max
          max_cubes[:blue] = [set.scan(BLUE_REGEX).flatten[0].to_i, max_cubes[:blue]].max
        end
      max_cubes.values.inject(:*)
    end
    .sum
end
