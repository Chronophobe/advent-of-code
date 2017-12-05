require_relative './helper.rb'

module Day05
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

  def execute(input, &block)
    instructions = input.dup
    n = 0
    pointer = 0
    while pointer < instructions.length
      n += 1
      pointer = jump(instructions, pointer, &block)
    end
    n
  end

  def increment(i)
    i + 1
  end

  def decrement(i)
    i >= 3 ? i - 1 : i + 1
  end

  def solve
    input = parse aoc('05')
    [execute(input, &method(:increment)), execute(input, &method(:decrement))]
  end
end
