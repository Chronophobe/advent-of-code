def parse(data)
  data.strip!
  data.split("\n").map { |row| row.split(/\s+/).map(&:to_i) }
end

def checksum(raw_data)
  data = parse(raw_data)
  partial = data.map { |row| yield row }
  partial.reduce(&:+) || 0
end

def minmax(data)
  checksum(data) { |row| row.max - row.min }
end

def divisible(data)
  checksum(data) do |row|
    result = 1
    row.each do |n|
      (row - [n]).each do |m|
        int, rem = n.divmod m
        result = int if rem == 0
      end
    end
    result
  end
end