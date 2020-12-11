pp(begin
  data = IO.read("input.txt").split("\n").map(&:chomp).map(&:to_i).sort

  last = 0
  diffs = []
  for n in data do
    diffs << n - last
    last = n
  end
  p data
  p diffs
  ones = diffs.select {|n| n == 1}.length
  threes = diffs.select {|n| n == 3}.length + 1
  p [diffs.length, ones, threes]
  ones * threes
end)

