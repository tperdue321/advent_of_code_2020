require 'pry'

def find(h, values) 
  values.map do |val|
    h.select do |k, v|
      h[k] == val
    end.keys
  end.flatten
end

def recursive_find(h, inner_bags)
  if inner_bags.empty?
    return inner_bags
  end
  new_inner_bags = inner_bags.map do |inner_bag|
    keys = h.values.select {|bags| bags.any? {|b| b.include?(inner_bag) } }

    find(h, keys)
  end.flatten
  new_inner_bags + recursive_find(h, new_inner_bags)
end

pp(begin
  h = {}
  IO.foreach('input.txt') do |line|
    outer_inter = line.split("contain")
    outer = outer_inter[0].chomp(" bags ")
    inners = outer_inter[1].split(/bag{1}s?/).map {|str| str.tr(",", "").strip}
    inners.delete(".")
    h[outer] = inners
  end
  # h
  values = h.values.select {|bags| bags.any? {|bag| bag =~ /shiny gold/ } }
  find(h, values)
  recursive_find(h, ["shiny gold"]).flatten.map(&:inspect).uniq.count
end)

