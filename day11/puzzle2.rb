# Advent of Code[About][Events][Shop][Settings][Log Out]tperdue321 22*
#    var y=2020;[Calendar][AoC++][Sponsors][Leaderboard][Stats]
# Our sponsors help make Advent of Code possible:
# TwilioQuest - Learn to code and lead your intrepid crew on a mission to save The Cloud in TwilioQuest, a PC role-playing game inspired by classics of the 16-bit era. Free forever, and available now for Windows, Mac, and Linux.
# --- Day 11: Seating System ---
# Your plane lands with plenty of time to spare. The final leg of your journey is a ferry that goes directly to the tropical island where you can finally start your vacation. As you reach the waiting area to board the ferry, you realize you're so early, nobody else has even arrived yet!

# By modeling the process people use to choose (or abandon) their seat in the waiting area, you're pretty sure you can predict the best place to sit. You make a quick map of the seat layout (your puzzle input).

# The seat layout fits neatly on a grid. Each position is either floor (.), an empty seat (L), or an occupied seat (#). For example, the initial seat layout might look like this:

# L.LL.LL.LL
# LLLLLLL.LL
# L.L.L..L..
# LLLL.LL.LL
# L.LL.LL.LL
# L.LLLLL.LL
# ..L.L.....
# LLLLLLLLLL
# L.LLLLLL.L
# L.LLLLL.LL
# Now, you just need to model the people who will be arriving shortly. Fortunately, people are entirely predictable and always follow a simple set of rules. All decisions are based on the number of occupied seats adjacent to a given seat (one of the eight positions immediately up, down, left, right, or diagonal from the seat). The following rules are applied to every seat simultaneously:

# If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
# If a seat is occupied (#) and four or more seats adjacent to it are also occupied, the seat becomes empty.
# Otherwise, the seat's state does not change.
# Floor (.) never changes; seats don't move, and nobody sits on the floor.

# After one round of these rules, every seat in the example layout becomes occupied:

# #.##.##.##
# #######.##
# #.#.#..#..
# ####.##.##
# #.##.##.##
# #.#####.##
# ..#.#.....
# ##########
# #.######.#
# #.#####.##
# After a second round, the seats with four or more occupied adjacent seats become empty again:

# #.LL.L#.##
# #LLLLLL.L#
# L.L.L..L..
# #LLL.LL.L#
# #.LL.LL.LL
# #.LLLL#.##
# ..L.L.....
# #LLLLLLLL#
# #.LLLLLL.L
# #.#LLLL.##
# This process continues for three more rounds:

# #.##.L#.##
# #L###LL.L#
# L.#.#..#..
# #L##.##.L#
# #.##.LL.LL
# #.###L#.##
# ..#.#.....
# #L######L#
# #.LL###L.L
# #.#L###.##
# #.#L.L#.##
# #LLL#LL.L#
# L.L.L..#..
# #LLL.##.L#
# #.LL.LL.LL
# #.LL#L#.##
# ..L.L.....
# #L#LLLL#L#
# #.LLLLLL.L
# #.#L#L#.##
# #.#L.L#.##
# #LLL#LL.L#
# L.#.L..#..
# #L##.##.L#
# #.#L.LL.LL
# #.#L#L#.##
# ..L.L.....
# #L#L##L#L#
# #.LLLLLL.L
# #.#L#L#.##
# At this point, something interesting happens: the chaos stabilizes and further applications of these rules cause no seats to change state! Once people stop moving around, you count 37 occupied seats.

# Simulate your seating area by applying the seating rules repeatedly until no seats change state. How many seats end up occupied?

# Your puzzle answer was 2453.

# --- Part Two ---
# As soon as people start to arrive, you realize your mistake. People don't just care about adjacent seats - they care about the first seat they can see in each of those eight directions!

# Now, instead of considering just the eight immediately adjacent seats, consider the first seat in each of those eight directions. For example, the empty seat below would see eight occupied seats:

# .......#.
# ...#.....
# .#.......
# .........
# ..#L....#
# ....#....
# .........
# #........
# ...#.....
# The leftmost empty seat below would only see one empty seat, but cannot see any of the occupied ones:

# .............
# .L.L.#.#.#.#.
# .............
# The empty seat below would see no occupied seats:

# .##.##.
# #.#.#.#
# ##...##
# ...L...
# ##...##
# #.#.#.#
# .##.##.
# Also, people seem to be more tolerant than you expected: it now takes five or more visible occupied seats for an occupied seat to become empty (rather than four or more from the previous rules). The other rules still apply: empty seats that see no occupied seats become occupied, seats matching no rule don't change, and floor never changes.

# Given the same starting layout as above, these new rules cause the seating area to shift around as follows:

# L.LL.LL.LL
# LLLLLLL.LL
# L.L.L..L..
# LLLL.LL.LL
# L.LL.LL.LL
# L.LLLLL.LL
# ..L.L.....
# LLLLLLLLLL
# L.LLLLLL.L
# L.LLLLL.LL
# #.##.##.##
# #######.##
# #.#.#..#..
# ####.##.##
# #.##.##.##
# #.#####.##
# ..#.#.....
# ##########
# #.######.#
# #.#####.##
# #.LL.LL.L#
# #LLLLLL.LL
# L.L.L..L..
# LLLL.LL.LL
# L.LL.LL.LL
# L.LLLLL.LL
# ..L.L.....
# LLLLLLLLL#
# #.LLLLLL.L
# #.LLLLL.L#
# #.L#.##.L#
# #L#####.LL
# L.#.#..#..
# ##L#.##.##
# #.##.#L.##
# #.#####.#L
# ..#.#.....
# LLL####LL#
# #.L#####.L
# #.L####.L#
# #.L#.L#.L#
# #LLLLLL.LL
# L.L.L..#..
# ##LL.LL.L#
# L.LL.LL.L#
# #.LLLLL.LL
# ..L.L.....
# LLLLLLLLL#
# #.LLLLL#.L
# #.L#LL#.L#
# #.L#.L#.L#
# #LLLLLL.LL
# L.L.L..#..
# ##L#.#L.L#
# L.L#.#L.L#
# #.L####.LL
# ..#.#.....
# LLL###LLL#
# #.LLLLL#.L
# #.L#LL#.L#
# #.L#.L#.L#
# #LLLLLL.LL
# L.L.L..#..
# ##L#.#L.L#
# L.L#.LL.L#
# #.LLLL#.LL
# ..#.L.....
# LLL###LLL#
# #.LLLLL#.L
# #.L#LL#.L#
# Again, at this point, people stop shifting around and the seating area reaches equilibrium. Once this occurs, you count 26 occupied seats.

# Given the new visibility method and the rule change for occupied seats becoming empty, once equilibrium is reached, how many seats end up occupied?

# Your puzzle answer was 2159.

# Both parts of this puzzle are complete! They provide two gold stars: **

# At this point, you should return to your Advent calendar and try another puzzle.

# If you still want to see it, you can get your puzzle input.

# You can also [Share] this puzzle.




# This is without a doubt some of the grossest code I've ever written.
@floor_map = IO.read("input.txt").chomp.split("\n").map{ |row| row.split("") }
@max_row = @floor_map.length - 1
@max_column = @floor_map.first.length - 1

def person_seen(dir, row, col)
  result = case dir
  when "T"
    (1..(row)).each do |n|
      if @floor_map[row-n][col] == "#"
        return true
      elsif @floor_map[row-n][col] == "L"
        return false
      end
    end
    return false
  when "TR"
    # do we hit the top or right first?
    moves = [row,(@max_column - col)].min
    (1..moves).each do |n|
      if @floor_map[row-n][col+n] == "#"
        return true
      elsif @floor_map[row-n][col+n] == "L"
        return false
      end
    end
    return false
  when "R"
    (1..(@max_column-col)).each do |n|
      if @floor_map[row][col+n] == "#"
        return true
      elsif @floor_map[row][col+n] == "L"
        return false
      end
    end
    return false
  when "BR"
    # do we hit the bottom or right first?
    moves = [(@max_row - row),(@max_column - col)].min
    (1..moves).each do |n|
      if @floor_map[row+n][col+n] == "#"
        return true
      elsif @floor_map[row+n][col+n] == "L"
        return false
      end
    end
    return false
  when "B"
    (1..(@max_row-row)).each do |n|
      if @floor_map[row+n][col] == "#"
        return true
      elsif @floor_map[row+n][col] == "L"
        return false
      end
    end
    return false
  when "BL"
    # do we hit the bottom or right first?
    moves = [(@max_row - row),col].min
    (1..moves).each do |n|
      if @floor_map[row+n][col-n] == "#"
        return true
      elsif @floor_map[row+n][col-n] == "L"
        return false
      end
    end
    return false
  when "L"
    (1..col).each do |n|
      if @floor_map[row][col-n] == "#"
        return true
      elsif @floor_map[row][col-n] == "L"
        return false
      end
    end
    return false
  when "TL"
    # do we hit the top or right first?
    moves = [row,col].min
    (1..moves).each do |n|
      if @floor_map[row-n][col-n] == "#"
        return true
      elsif @floor_map[row-n][col-n] == "L"
        return false
      end
    end
    return false
  end
end

pp(begin
  last_seated = 0
  currently_seated = 0
  i = 1
  loop do
    currently_seated = 0
    @new_floor_map = Marshal.load(Marshal.dump(@floor_map))
    @floor_map.each_with_index do |row,i| 
      row.each_with_index do |chair, j|
        next if chair == "."
        people_seen = 0
        %w[T TR R BR B BL L TL].each do |dir|
          seen = person_seen(dir, i, j)
          people_seen += 1 if seen
        end
        if chair == "L" && people_seen == 0
          @new_floor_map[i][j] = "#"
          currently_seated += 1
        elsif chair == "#" && people_seen > 4
          @new_floor_map[i][j] = "L"
        else
          @new_floor_map[i][j] = @floor_map[i][j]
          currently_seated += 1 if @floor_map[i][j] == "#" 
        end
      end # end column
    end # end rows
    @floor_map = @new_floor_map
    break if currently_seated == last_seated
    last_seated = currently_seated
    i += 1
  end
  currently_seated
end)

