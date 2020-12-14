pp(begin
  timestamp, bus_lines = IO.read("input.txt").split("\n")
  bus_lines = bus_lines.split(",").reject! {|bus| bus == "x"}.map(&:to_i)
  timestamp = timestamp.to_i
  best_bus = bus_lines.map do |bus|
    modulus = timestamp % bus
    [bus, bus - modulus]
  end.min { |bus1, bus2| bus1[1] <=> bus2[1] }
  best_bus.reduce(:*)
end)