require_relative './helper.rb'

def phrases(input)
  input.strip.split("\n")
end

def valid?(phrase, anagram=false)
  words = phrase.split(' ')
  words = words.map { |w| w.chars.sort.join } if anagram
  words.count == words.uniq.count
end

def solve
  input = aoc('04')
  ps = phrases(input)
  [ps.select{ |p| valid?(p) }.count,
   ps.select{ |p| valid?(p, true) }.count]
end
