file = File.open("input.txt")
data = file.readlines(&:chomp).map {|str| str.split(" ") }

valid_count = 0

data.each do |array|
  low, high = array[0].split("-").map(&:to_i)
  letter = array[1].sub(":", "")
  password = array[2]

  letter_count = 0
  valid = true

  # for each char of password
  password.each_char do |ch|
    # add to letter count
    letter_count += 1 if letter == ch # count found letter

    if letter_count > high # invalid if over high limit
      valid = false
      break # end early if we are over the high limit
    end
  end

  valid = false if letter_count < low # invalid if below low limit
  valid_count += 1 if valid # count valid password
end

puts valid_count
