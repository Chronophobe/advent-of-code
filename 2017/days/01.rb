def captcha(input, use_offset=false)
  input.gsub! /[^0-9]/, ''
  offset = use_offset ? input.length / 2 : 1
  input.split('').each.with_index(offset).reduce(0) do |memo, (char, i)|
    memo += char.to_i if char == input[i % input.length]
    memo
  end
end