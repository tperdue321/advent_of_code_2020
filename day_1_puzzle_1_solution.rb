file = File.open("day_1_puzzle_1_input.txt", "r")
data = file.readlines.map(&:chomp).map(&:to_i)

data.each do |x|
  data.each do |y|
    @x = x * y if x + y == 2020
    break if !@x.nil?
  end
  break if !@x.nil?
end

puts @x