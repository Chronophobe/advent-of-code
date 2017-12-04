def phrases(input)
  input.strip.split("\n")
end

def valid?(phrase, anagram=false)
  words = phrase.split(' ')
  words = words.map { |w| w.chars.sort.join } if anagram
  words.count == words.uniq.count
end