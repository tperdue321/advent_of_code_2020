data = IO.read("input.txt").split("\n").map(&:to_i)

preamble = data[0..24]
oldest = 0
h = Hash.new {|h,k| h[k] = []}
preamble.permutation(2).to_a.each {|sums| h[sums.first] << sums.reduce(:+)}

data[25..-1].each do |n|
  sums = h.values.flatten

  @mismatch = n
  break if !sums.include?(n)

  # remove the oldest set of values
  h.delete(data[oldest])
  oldest += 1

  # calculate the set of sums
  h[n] = h.keys.map do |key|
    key + n
  end
end
@mismatch

found_values = []
data.each_with_index do |n1,i|
  contiguous_values = [n1]
  data[i+1..-1].each do |n2|
    contiguous_values << n2
    if contiguous_values.reduce(:+) == @mismatch
      found_values = contiguous_values
      break
    elsif contiguous_values.reduce(:+) > @mismatch
      break # exit inner summing loop early if we have exceeded the mismatched value
    end
  end
  break if !found_values.empty?
end

p found_values.min + found_values.max