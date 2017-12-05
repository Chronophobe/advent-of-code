class Spiral
  def initialize
  end

  def next_pos
    i = 1
    loop do
      yield i
      yield i
      i += 1
    end
  end

  def fill
    @values = Hash.new
    put(0,0,1)
    x = 0
    y = 0
    directions = [[0, 1], [1,0], [0, -1], [-1, 0]].cycle
    next_pos do |p|
      px, py = directions.next
      while p > 0
        x += px
        y += py

        vs = surrounding_values(x,y)
        yield put(x, y, vs.reduce(&:+))
        p -= 1
      end
    end
  end

  def surrounding_values(x, y)
    [
      fetch(x - 1, y - 1),
      fetch(x - 1, y),
      fetch(x - 1, y + 1),
      fetch(x + 1, y - 1),
      fetch(x + 1, y),
      fetch(x + 1, y + 1),
      fetch(x, y - 1),
      fetch(x, y + 1)
    ]
  end

  def fetch(x, y)
    return 0 if @values[x].nil?
    @values[x][y] || 0
  end

  def put(x, y, v)
    @values[x] = Hash.new if @values[x].nil?
    @values[x][y] = v
  end
end