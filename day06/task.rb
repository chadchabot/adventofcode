def run1(input)
  rows, cols = 1000, 1000
  matrix = Array.new(rows) { Array.new(cols) }

  input.each do |line|
    job = split_line line
    (job[:start][0]..job[:end][0]).each do |x|
      (job[:start][1]..job[:end][1]).each do |y|
        x = x.to_i
        y = y.to_i
        case job[:op]
          when "toggle" then matrix[x][y] = !matrix[x][y]
          when "on"     then matrix[x][y] = true
          when "off"    then matrix[x][y] = false
        end
      end
    end
  end
  count_lights(matrix)
end

def count_lights(matrix)
  matrix.flatten().count {|e| e == true}
end

#returns a hash, {operation, starting coords, end coords}
def split_line(line)
  if /toggle/.match line
    parts = line[7..-1].split(" ")
    res = ["toggle"] + parts
  elsif /turn off/.match line
    res = ["off"] + line[9..-1].split(" ")
  elsif /turn on/.match line
    parts = line[8..-1].split(" ")
    res = ["on"] + parts
  else
    res = [nil, nil, nil, nil]
  end
  return {op: res[0], start: res[1].split(","), end: res[3].split(",")}
end

# test cases for part 1
puts "\n\n************************************"
puts "\tTesting part I"
puts "************************************"

steps = [
  "turn on 0,0 through 999,999",
  "toggle 0,0 through 999,0",
  "turn off 499,499 through 500,500"
]

case_1 = {name: "Case 1", key: [steps[0]], answer: 1000000}
case_2 = {name: "Case 2", key: steps[0..1], answer: 999000}
case_3 = {name: "Case 3", key: steps,  answer:      998996}

test_cases = []
#test_cases = [case_1, case_2, case_3]
test_cases.each do |test_case|
  result = run1(test_case[:key])
  puts result
  if result == test_case[:answer]
    puts "test #{test_case[:name]} passes!"
  else
    puts "test #{test_case[:name]} fails"
  end
end


puts "\n\n************************************"
puts "\tString search part I"
puts "************************************"

text = File.open('input.txt').read()
result = run(text.split("\n"))
puts "There are #{result} lights lit"


def run2(input)
  rows, cols = 1000, 1000
  matrix = Array.new(rows) { Array.new(cols, 0) }

  input.each do |line|
    job = split_line line
    (job[:start][0]..job[:end][0]).each do |x|
      (job[:start][1]..job[:end][1]).each do |y|
        x = x.to_i
        y = y.to_i
        cell_value = matrix[x][y]
        case job[:op]
          when "toggle" then matrix[x][y] += 2
          when "on"     then matrix[x][y] += 1
          when "off"    then matrix[x][y] = cell_value - 1 if cell_value > 0 else 0
        end
      end
    end
  end
  total_brightness(matrix)
end

def total_brightness(matrix)
  matrix.flatten().reduce {|v, t| t += v}
end

puts "\n\n************************************"
puts "\tString search part II"
puts "************************************"

result2 = run2(text.split("\n"))
puts "the cumulative brightness is #{result2}"
