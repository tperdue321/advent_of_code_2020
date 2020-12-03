file = File.open("day_1_input.txt", "r")
data = file.readlines.map(&:chomp).map(&:to_i)

data.each do |x|
  data.each do |y|
    next if x + y >= 2020
    data.each do |z|
      @x = x * y * z if x + y + z == 2020
      break if !@x.nil?
    end
    break if !@x.nil?
  end
  break if !@x.nil?
end

puts @x