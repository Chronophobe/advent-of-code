require_relative './helper.rb'

module Day02
  def parse(data)
    data.strip!
    data.split("\n").map { |row| row.split(/\s+/).map(&:to_i) }
  end

  def checksum(input)
    data = input.dup
    partial = data.map { |row| yield row }
    partial.reduce(&:+) || 0
  end

  def minmax(row)
    row.max - row.min
  end

  def divisible(row)
    result = 1
    row.each do |n|
      (row - [n]).each do |m|
        int, rem = n.divmod m
        result = int if rem.zero?
      end
    end
    result
  end

  def solve
    input = parse aoc('02')
    [checksum(input, &method(:minmax)), checksum(input, &method(:divisible))]
  end
end
