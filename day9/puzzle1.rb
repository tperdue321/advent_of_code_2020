pp(begin
  data = IO.read("input.txt").split("\n").map(&:to_i)

  preamble = data[0..24]
  oldest = 0
  h = Hash.new {|h,k| h[k] = []}
  preamble.permutation(2).to_a.each {|sums| h[sums.first] << sums.reduce(:+)}

  mismatch = -1
  data[25..-1].each do |n|
    sums = h.values.flatten.uniq

    mismatch = n
    break if !sums.include?(n)
    
    # remove the oldest set of values
    h.delete(data[oldest])
    oldest += 1

    # calculate the set of sums
    h[n] = h.keys.map do |key|
      key + n
    end
  end
  mismatch
end)