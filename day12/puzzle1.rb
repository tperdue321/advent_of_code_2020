pp(begin
  instructions = IO.read("input.txt").chomp.split("\n").map {|instruction| instruction.split(/(\d{1,4})/)}
  location = {"N": 0, "E": 0, "S": 0, "W": 0, direction: "E"}
  directions = %w[N E S W]
  instructions.each do |instruc|
    case instruc[0]
    when "R"
      new_index = ((instruc[1].to_i / 90) + directions.index(location[:direction])) % 4
      location[:direction] = directions[new_index]
    when "L"
      new_index = (directions.index(location[:direction]) - (instruc[1].to_i / 90)) % 4
      location[:direction] = directions[new_index]
    when "F"
      location[location[:direction].to_sym] += instruc[1].to_i
    else
      location[instruc[0].to_sym] += instruc[1].to_i
    end
  end
  
  (location[:N] - location[:S]).abs + (location[:E] - location[:W]).abs 
end)