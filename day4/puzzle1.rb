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
  passports.select do |p|
    KEYS.map { |k|
      p.keys.include?(k)
    }.reduce(true) {|initial, found| initial && found }
  end.count

end)