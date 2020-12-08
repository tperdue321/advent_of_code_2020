require 'pry'

def recursive_tree_multiplication(bags, count, h)
  return 0 if bags.empty?
  bags.map do |bag|
    c =  bag[:count] * count
    c + recursive_tree_multiplication(h[bag[:name]], c, h)
  end.reduce(:+)
end

pp(begin
  h = {}
  IO.foreach('input.txt') do |line|
    outer_inter = line.split("contain")
    outer = outer_inter[0].chomp(" bags ")

    inners = if outer_inter[1].strip == "no other bags."
      []
    else
      outer_inter[1].split(/bag{1}s?/).map {|str| str.tr(",", "").strip}
    end
    inners.delete(".")
    h[outer] = inners.map do |inner|
      count, *bag_name = inner.split(" ")
      {count: count.to_i, name: bag_name.join(" ")}
    end
  end
  h

  recursive_tree_multiplication(h["shiny gold"], 1, h)
end)
