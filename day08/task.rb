def run1(input)
  result = {code: 0, chars: 0}

  input.split("\n").each do |line|
    result[:code]  += line.length
    result[:chars] += eval(line).length
  end

  result
end

def run2(input)
  result = {code: 0, chars: 0}

  input.split("\n").each do |line|
    result[:code]  += line.length
    result[:chars] += line.inspect.length
  end
  result
end

# test cases for part 1
puts "\n\n************************************"
puts "\tTesting part I"
puts "************************************"

case_1 = {name: "Case 1", key: '""', answer: {code: 2, chars: 0 }}
case_2 = {name: "Case 1", key: '"abc"', answer: {code: 5, chars: 3 }}
case_3 = {name: "Case 1", key: '"aaa\"aaa"', answer: {code: 10, chars: 7 }}
case_4 = {name: "Case 1", key: '"\x27"', answer: {code: 6, chars: 1 }}

test_cases = [case_1, case_2, case_3, case_4]

test_cases.each do |test_case|
  result = run1(test_case[:key])
  puts "result: #{result}"
  puts "answer: #{test_case[:answer]}"
  if result == test_case[:answer]
    puts "test #{test_case[:name]} passes!"
  else
    puts "test #{test_case[:name]} fails"
  end
end


puts "\n\n************************************"
puts "\tDecoding part I"
puts "************************************"

text = File.open('input.txt').read()
result1 = run1(text)
puts result1[:code] - result1[:chars]

# test cases for part 2
puts "\n\n************************************"
puts "\tTesting part II"
puts "************************************"

case_1 = {name: "Case 1", key: '""', answer: {code: 2, chars: 6 }}
case_2 = {name: "Case 1", key: '"abc"', answer: {code: 5, chars: 9 }}
case_3 = {name: "Case 1", key: '"aaa\"aaa"', answer: {code: 10, chars: 16 }}
case_4 = {name: "Case 1", key: '"\x27"', answer: {code: 6, chars: 11 }}

test_cases = [case_1, case_2, case_3, case_4]

test_cases.each do |test_case|
  result = run2(test_case[:key])
  puts "result: #{result}"
  puts "answer: #{test_case[:answer]}"
  if result == test_case[:answer]
    puts "test #{test_case[:name]} passes!"
  else
    puts "test #{test_case[:name]} fails"
  end
end

puts "\n\n************************************"
puts "\sEncoding part II"
puts "************************************"

result2 = run2(text)
puts result2[:chars] - result2[:code]
