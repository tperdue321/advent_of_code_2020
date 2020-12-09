h = {}
step = 0
is_loop = false
accummulator = 0
pp(begin
  instructions = IO.read("input.txt").split("\n").map do |line|
    action, value = line.chomp.split(" ")
    h[step] = {action: action, value: value.to_i, touched: false}
    step += 1
  end
  h

  step = 0
  loop do

    is_loop = h[step][:touched]

    break if is_loop

    cur_step = h[step]
    if cur_step[:action] == "acc"
      accummulator += cur_step[:value]
      step += 1
    elsif cur_step[:action] == "jmp"
      step += cur_step[:value]
    else
      step += 1
    end

    cur_step[:touched] = true
  end
  accummulator
end)

