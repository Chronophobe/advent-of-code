def input(day)
  pwd = File.expand_path File.dirname(__FILE__)
  path = File.join(pwd, "#{day}.input")
  File.read(path)
end