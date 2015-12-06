#!/bin/ruby

#directions is a string
def track_floor(directions, break_condition = nil, verbose = false)
  idx = 1
  floor = 0

  directions.each_char do |c|
    if c == "("
      floor += 1
    elsif c == ")"
      floor -= 1
    end
    puts "char position: #{idx} - char: #{c} - floor: #{floor}" if verbose
    return idx if floor == break_condition
    idx += 1
  end
  return floor
end


# test cases for part 1
puts "\n\n************************************"
puts "\tTesting part I"
puts "************************************"

case_1 = {name: "Case 1", directions: "(())", answer: 0}
case_2 = {name: "Case 2", directions: "()()", answer: 0}
case_3 = {name: "Case 3", directions: "(((", answer: 3}
case_4 = {name: "Case 4", directions: "(()(()(", answer: 3}
case_5 = {name: "Case 5", directions: "))(((((", answer: 3}
case_6 = {name: "Case 6", directions: ")())())", answer: -3}

test_cases = [case_1, case_2, case_3, case_4, case_5, case_6]

test_cases.each do |test_case|
  result = track_floor(test_case[:directions], nil, true)
  if result == test_case[:answer]
    puts "test #{test_case[:name]} passes!"
  else
    puts "test #{test_case[:name]} fails"
  end
end


input = File.open('input.txt').read()

#task 1 input
puts track_floor(input)

#task 2 input
puts track_floor(input, -1)


