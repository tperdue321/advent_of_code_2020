trees_hit = 0
position = 0

def tree?(char)
  char == "#"
end

def calc_position(position, line_length)
  position += 3
  position -= line_length if position >= line_length
  position
end

IO.foreach("input.txt") do |line|
  line = line.chomp
  trees_hit += 1 if tree?(line[position])
  position = calc_position(position, line.length)
end

puts trees_hit
