p IO.read("input.txt").split("\n\n").map { |group| group.split("\n").map(&:chars).reduce(:&)}.flatten.count
