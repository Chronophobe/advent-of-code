require_relative './helper.rb'

module Day01
  def captcha(input, use_offset=false)
    input.gsub! /[^0-9]/, ''
    offset = use_offset ? input.length / 2 : 1
    input.split('').each.with_index(offset).reduce(0) do |memo, (char, i)|
      memo += char.to_i if char == input[i % input.length]
      memo
    end
  end

  def solve
    input = aoc('01')
    [captcha(input), captcha(input, true)]
  end
end