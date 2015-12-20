initial_state = File.open("input.txt").read().split("\n")

class Pixel
  attr_accessor :x, :y, :on

  def initialize(x, y, on)
    @x = x
    @y = y
    @on = on
    @next_state = nil
    @fixed = [[0,0], [99,0], [0,99], [99,99]].include? [x,y]
  end

  def on?
    @on == true
  end

  def char
    @on ? '#' : '.'
  end

  def to_s
    #puts "called to_s with: #{char()}"
    char()
  end

  def +@()
    @on ? 1 : 0
  end

  def next_state(pixels)
    if @fixed
      @next_state = true
      return
    end

    neighbours = pixels.select {|p| p.on and p.x.between?(@x-1,@x+1) and p.y.between?(@y-1,@y+1)}
    neighbours.reject! {|p| p.x == @x and p.y == @y}

    num_active = neighbours.length
    if on?
      if [2,3].include? num_active
        @next_state = true
      else
        @next_state = false
      end
    else
      if num_active == 3
        @next_state = true
      else
        @next_state = false
      end
    end
  end

  def step
    @on = @next_state
    @next_state = nil
  end
end


class Grid
  attr_reader :pixels

  def initialize(pixels)
    @pixels = pixels
  end

  def number_on
    @pixels.select {|p| p.on?}.length
    #@pixels.inject(&:+)
    #why can't I just add objects with the + method?
  end

  def step
    @pixels.map {|p| p.next_state(@pixels)}
    @pixels.map {|p| p.step()}
  end

  def to_s
    out = ""
    @pixels.collect {|p| p.to_s}.join("").scan(/.{100}/).each do |line|
      out << line
      out << "\n"
    end
    out
  end
end


def build_grid(input)
  puts "building grid"
  pixels = []
  input.each_with_index do |line, x|
    line.split("").each_with_index do |pixel, y|
      pixels << Pixel.new(x, y, pixel == '#')
    end
  end
  Grid.new pixels
end

grid = build_grid(initial_state)

num_steps = 100

num_steps.times do |i|
  grid.step()
  puts "On turn #{i} there are #{grid.number_on()} lights on"
end

puts grid.number_on()
