p IO.read("input.txt").split("\n\n").map { |group| group.tr("\n", "").chars.to_a.uniq.count}.reduce(:+)
