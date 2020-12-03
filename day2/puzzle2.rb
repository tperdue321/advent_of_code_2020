file = File.open("input.txt")
data = file.readlines(&:chomp).map {|str| str.split(" ") }

valid_count = 0

data.each do |array|
  first_found = second_found = false

  first, second = array[0].split("-").map(&:to_i)
  letter = array[1].sub(":", "")
  password = array[2]

  first_found = password[first-1] == letter
  second_found = password[second-1] == letter
  valid_count += 1 if first_found ^ second_found
end
puts valid_count

