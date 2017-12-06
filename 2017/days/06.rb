require_relative './helper.rb'

require 'set'

module Day06
  def parse(input)
    input.split.map(&:to_i)
  end

  def index_at_max(data)
    maximum = 0
    index = 0
    data.each_with_index do |n, i|
      if n > maximum
        maximum = n
        index = i
      end
    end
    index
  end

  def redistribute(memory)
    data = memory.dup
    i = index_at_max(data)
    size = data[i]
    data[i] = 0
    while size > 0
      i += 1
      data[i % data.length] += 1
      size -= 1
    end
    data
  end

  def routine(memory)
    seen = Set.new
    counter = 0
    until seen.include? memory do
      seen.add memory
      memory = redistribute(memory)
      counter += 1
      p memory
    end
    counter
  end

  def solve
    input = parse aoc('06')
    routine(input)
  end
end