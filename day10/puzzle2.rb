data = IO.read("input.txt").split("\n").map(&:chomp).map(&:to_i).sort
data.unshift(0)
paths = Array.new(0)
data.each_with_index do |n,i|
  variations = 1
  j = 2
  while i-j > -1 && n - data[i-j] <= 3 
    variations += 1
    j += 1
  end
  last = i-variations
  p last
  if last > -1
    paths <<  paths[last..(i-1)].reduce(:+)
  else
    paths << (paths.last || 1)
  end

end
p paths.last
