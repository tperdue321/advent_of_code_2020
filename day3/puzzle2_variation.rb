data = {
  angle1: { right: 1, down: 1, trees_hit: 0, position: 0 },
  angle2: { right: 3, down: 1, trees_hit: 0, position: 0 },
  angle3: { right: 5, down: 1, trees_hit: 0, position: 0 },
  angle4: { right: 7, down: 1, trees_hit: 0, position: 0 },
  angle5: { right: 1, down: 2, trees_hit: 0, position: 0 },
}

def tree?(char)
  char == "#"
end

def calc_position(position, line_length, rightshift)
  (position + rightshift) % line_length
end

line_num = -1
# run through each line once for a O(n) algo where n is the number of input lines
IO.foreach("input.txt") do |line|
  line = line.chomp
  line_num += 1
  length = line.length

  # data keys is my k
  data.each do |_k, data_hash|
    right, down, position = data_hash.values_at(:right, :down, :position)

    next if (line_num % down) != 0

    data_hash[:trees_hit] += 1 if tree?(line[position])
    data_hash[:position] = calc_position(position, length, right)
  end
end

puts data.values.map {|h| h[:trees_hit]}.reduce(:*)
