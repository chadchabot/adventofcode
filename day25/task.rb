starting_value = 20151125

def find_value(end_X, end_Y, starting_value)
  x = 1
  y = 1

  curr_val = starting_value
  loop do
    if y == 1
      y = x + 1
      x = 1
    else
      y -= 1
      x += 1
    end

    curr_val = (curr_val*252533)%33554393
    if x == end_X and y == end_Y
      return curr_val
    end
  end
end

target_X = 3019
target_Y = 3010

result = find_value(target_X, target_Y, starting_value)
puts result
