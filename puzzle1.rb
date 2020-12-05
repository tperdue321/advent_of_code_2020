require 'pry'
pp(begin
  id = 0
  IO.foreach("input.txt") do |line|
    final_row = final_column = fr = l = 0; br = 127; r = 7
    line.chomp.each_char do |chr|
      if chr == "F"
        final_row = br = (fr + br) / 2
      elsif chr == "B"
        fr = (fr + br) / 2
        final_row = fr + 1
      elsif chr == "L"
        r = (l + r) / 2
      else
        final_column = l = (l + r) / 2
        final_column = l + 1
      end
    end

    id = final_row * 8 + final_column if (final_row * 8 + final_column) > id
  end

  id
end)