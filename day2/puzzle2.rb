valid_count = 0
IO.foreach("input.txt") do |line|
  array = line.scan(/(\d+).(\d+)\s([a-zA-Z]+):\s([a-zA-Z]+)/).flatten
  first, second, letter, password = array
  valid_count += 1 if (password[first.to_i-1] == letter) ^ (password[second.to_i-1] == letter)
end
puts valid_count
