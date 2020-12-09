h = {}
step = 0
is_loop = false
accummulator = 0
stack = [] # used to trace back steps I've already run if we hit an infinite loop
pop_count = 1 # how many steps to pop off the stack


# data hash setup
# h = {
#   1 => {action: action, value: value.to_i, touched: false, step: step},
#   ...
#   n => {action: action, value: value.to_i, touched: false, step: step},
# }

def build_steps
  step = 0
  h = {}
  IO.read("input.txt").split("\n").map do |line|
    action, value = line.chomp.split(" ")
    h[step] = {action: action, value: value.to_i, touched: false, step: step}
    step += 1
  end
  h
end

h = build_steps

loop do
  break if step == h.keys.length
  is_loop = h[step][:touched]

  # step to act on
  cur_step = h[step]

  # if it's a loop let's pop the last n steps off the stack, and
  # flip the operation of the oldest failed step of it's a jmp or nop
  if is_loop
    failed_step = stack.shift(pop_count).last

    # figure out the most recent failed step and replay
    # the whole instruction set from scratch with only that
    # one step flipped
    h = build_steps
    h[failed_step[:step]][:action] = if h[failed_step[:step]][:action] == "jmp"
      "nop"
    elsif h[failed_step[:step]][:action]  == "nop"
        "jmp"
    end
    # reset values to initial
    accummulator = 0
    step = 0
    cur_step = h[step]

    # increment pop count incase this replay didn't go far enough
    # back in time.
    pop_count += 1
  end

  # state machine
  if cur_step[:action] == "acc"
    accummulator += cur_step[:value]
    step += 1
  elsif cur_step[:action] == "jmp"
    step += cur_step[:value]
  else
    step += 1
  end
  cur_step[:touched] = true
  # put current step on the stack
  stack.unshift(cur_step)
end

p  accummulator
