def parse(input)
  input.split.map(&:to_i)
end

def jump(instructions, pointer)
  new_pointer = pointer + instructions[pointer]
  if block_given?
    instructions[pointer] = yield instructions[pointer]
  else
    instructions[pointer] += 1
  end
  new_pointer
end

def execute(instructions, &block)
  n = 0
  pointer = 0
  while pointer < instructions.length
    n += 1
    pointer = jump(instructions, pointer, &block)
  end
  n
end