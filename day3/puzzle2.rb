# [right, down]
angles = [[1,1],[3,1],[5,1],[7,1],[1,2]]


def tree?(char)
  char == "#"
end

def calc_position(position, line_length, rightshift)
  position += rightshift
  position -= line_length if position >= line_length
  position
end

all_trees_hit = []
angles.each do |angle|
  rightshift, downshift = angle
  trees_hit = 0
  position = 0
  line_num = 1
  IO.foreach("input.txt") do |line|
    line_num += 1
    next if (line_num % downshift) != 0
    line = line.chomp
    trees_hit += 1 if tree?(line[position])
    position = calc_position(position, line.length, rightshift)
  end
  all_trees_hit << trees_hit
end

puts all_trees_hit.reduce(:*)
