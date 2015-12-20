initial_state = File.open("input.txt").read().gsub(/[#\.]/, '#' => 1, '.' => 0 ).split("\n")

def build_grid(input)
  matrix = []
  input.each do |line|
    matrix << line.split("").map {|e| e.to_i}
  end
  matrix
end

def print_grid(grid)
  grid.each {|line| puts line.join("") + "\n"}
end

def step_grid(grid)
  new_grid = Marshal.load(Marshal.dump(grid))
  (0..GRID_SIZE-1).each do |x|
    (0..GRID_SIZE-1).each do |y|
      pixel = grid[x][y]
      neighbour_count = neighbour_count(grid, x, y)
      next_state =
        if pixel == 1
          [2,3].include?(neighbour_count) ? 1 : 0
        else
           3 == neighbour_count ? 1 : 0
        end
      new_grid[x][y] = next_state
    end
  end
  new_grid
end

def neighbour_count(grid, x, y)
  neighbours = []
  (x-1..x+1).each do |px|
    (y-1..y+1).each do |py|
      next if x == px and y == py
      next if px < 0 || px > GRID_SIZE - 1
      next if py < 0 || py > GRID_SIZE - 1
      neighbours << grid[px][py]
    end
  end
  neighbours.reduce(:+)
end

def active_count(grid)
  grid.map {|row| row.reduce(:+)}.reduce(:+)
end

def force_corners(grid)
  grid[0][0] = 1
  grid[0][GRID_SIZE-1] = 1
  grid[GRID_SIZE-1][0] = 1
  grid[GRID_SIZE-1][GRID_SIZE-1] = 1
end

NEIGHBOUR_COORDS = [-1,0,1].repeated_permutation(2).to_a.keep_if {|e| e != [0,0]}
GRID_SIZE = 100

NUM_STEPS= 100
FORCE = true

grid = build_grid(initial_state)
force_corners(grid) if FORCE
puts active_count(grid)

(1..NUM_STEPS).each do |i|
  grid = step_grid(grid)
  force_corners(grid) if FORCE
  puts "On turn #{i} there are #{active_count(grid)} lights on"
end
