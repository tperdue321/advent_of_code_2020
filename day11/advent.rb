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


# If a seat is empty (L) and there are no occupied seats adjacent to it, the seat becomes occupied.
# If a seat is occupied (#) and four or more seats adjacent to it are also occupied, the seat becomes empty.
# Otherwise, the seat's state does not change.
# Floor (.) never changes; seats don't move, and nobody sits on the floor.

@floor_map = IO.read("input.txt").chomp.split("\n").map{ |row| row.split("") }
@max_row = @floor_map.length
@max_column = @floor_map.first.length
def valid_cell(row, column, cur_row, cur_column)
  cur_row < @max_row && cur_row > -1 &&
  cur_column < @max_column && cur_column > -1 &&
  !(row == cur_row && column == cur_column) 
end

pp(begin
  touched = false
  i = 0
  currently_seated = 0
  last_seated = 0
  loop do
    touched = false
    touched_count = 0
    currently_seated = 0
    @new_floor_map = Marshal.load(Marshal.dump(@floor_map))
    @floor_map.each_with_index do |row,i| 
      row.each_with_index do |chair, j|
        adject_chairs = []
        (0..2).each do |r|
          cur_row = i - 1 + r 
          (0..2).each do |c|
            cur_column = j - 1 + c
            adject_chairs << @floor_map[cur_row][cur_column] if valid_cell(i,j, cur_row, cur_column)
            occupied_seats = adject_chairs.select {|chair| chair == "#"}.length
            # p occupied_seats
            if chair == "L" && occupied_seats == 0
              @new_floor_map[i][j] = "#"
              touched = true
              touched_count += 1
            elsif chair == "#" && occupied_seats > 3
              @new_floor_map[i][j] = "L"
              touched = true
              touched_count += 1
            else
              @new_floor_map[i][j] = @floor_map[i][j]
            end
          end # (0..2)
        end  # (0..2)
      end # end column
    end # end rows
    @floor_map = @new_floor_map
    currently_seated = @floor_map.flatten.select{|c| c == "#"}.count
    
    i += 1
    break if currently_seated == last_seated
    last_seated = currently_seated
  end
  currently_seated
end)
