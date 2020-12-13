waypoint = { dir1: { dir: :E, distance: 10 }, dir2: { dir: :N, distance: 1 } }
location = {"N": 0, "E": 0, "S": 0, "W": 0, direction: "E"}

flip_map = { N: :S, S: :N, E: :W, W: :E }
directions = %i[N E S W]
lat = %w[N S]
log = %w[E W]

instructions = IO.read("input.txt").chomp.split("\n").map {|instruction| instruction.split(/(\d{1,4})/)}
instructions.each do |instruc|
  distance = instruc[1].to_i
  case instruc[0]
  when "R"
    new_dir1 = ((distance / 90) + directions.index(waypoint[:dir1][:dir])) % 4
    new_dir2 = ((distance / 90) + directions.index(waypoint[:dir2][:dir])) % 4
    waypoint[:dir1][:dir] = directions[new_dir1]
    waypoint[:dir2][:dir] = directions[new_dir2]
  when "L"
    new_dir1 = (directions.index(waypoint[:dir1][:dir]) - (distance / 90)) % 4
    new_dir2 = (directions.index(waypoint[:dir2][:dir]) - (distance / 90)) % 4
    waypoint[:dir1][:dir] = directions[new_dir1]
    waypoint[:dir2][:dir] = directions[new_dir2]
  when "F"
    location[waypoint[:dir1][:dir]] += (waypoint[:dir1][:distance] * distance)
    location[waypoint[:dir2][:dir]] += (waypoint[:dir2][:distance] * distance)
  when "N", "S"
    dir = lat.include?(waypoint[:dir1][:dir].to_s) ? :dir1 : :dir2
    waypoint[dir][:dir] == instruc[0].to_sym ? waypoint[dir][:distance] += distance : waypoint[dir][:distance] -= distance
    if waypoint[dir][:distance] < 0
      waypoint[dir][:dir] = flip_map[waypoint[dir][:dir]]
      waypoint[dir][:distance] = waypoint[dir][:distance].abs
    end
  when "W", "E"
    dir = log.include?(waypoint[:dir1][:dir].to_s) ? :dir1 : :dir2
    waypoint[dir][:dir] == instruc[0].to_sym ? waypoint[dir][:distance] += distance : waypoint[dir][:distance] -= distance
    if waypoint[dir][:distance] < 0
      waypoint[dir][:dir] = flip_map[waypoint[dir][:dir]]
      waypoint[dir][:distance] = waypoint[dir][:distance].abs
    end
  end
end
p (location[:N] - location[:S]).abs + (location[:E] - location[:W]).abs
