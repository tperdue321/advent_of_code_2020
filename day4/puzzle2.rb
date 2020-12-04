pp(begin
  KEYS = %w[
    byr
    iyr
    eyr
    hgt
    hcl
    ecl
    pid
  ]

  # create each individual passport
  # passports = [{"eyr" => "2029",...,"pid" => "3423523"},{...}]
  passports = IO.read('input.txt').split("\n\n").map do |passport|
    h = {}
    passport.split(/\s|\n/).map do |key_value|
      k, v = key_value.split(":")
      h[k] = v
    end
    h
  end

  # select the passports that all the required keys are in
  passports_with_keys_present = passports.select do |p|
    KEYS.map { |k|
      p.keys.include?(k)
    }.reduce(true) {|initial, found| initial && found }
  end

#   byr (Birth Year) - four digits; at least 1920 and at most 2002.
# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# hgt (Height) - a number followed by either cm or in:
# If cm, the number must be at least 150 and at most 193.
# If in, the number must be at least 59 and at most 76.
# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# pid (Passport ID) - a nine-digit number, including leading zeroes.
# cid (Country ID) - ignored, missing or not.
  EYE_COLORS = %w[amb blu brn gry grn hzl oth]

  passports_with_keys_present.select do |passport|
    hgt_cm = passport["hgt"].scan(/(\d+)cm/).flatten.first.to_i
    hgt_in = passport["hgt"].scan(/(\d+)in/).flatten.first.to_i

    ((hgt_cm >= 150 && hgt_cm <= 193) || (hgt_in >= 59 && hgt_in <= 76)) &&
    passport["byr"].to_i >= 1920 && passport["byr"].to_i <= 2002 &&
    passport["iyr"].to_i >= 2010 && passport["iyr"].to_i <= 2020 &&
    passport["eyr"].to_i >= 2020 && passport["eyr"].to_i <= 2030 &&
    !(passport["hcl"] =~ /#[\d|a-f]{6}/).nil? &&
    EYE_COLORS.include?(passport["ecl"]) &&
    passport["pid"].length == 9
  end.count

end)