def vowel_count(string)
  string.split("").select {|c| ['a','e','i','o','u'].include? c}.count > 2
end

def string_has_run?(string)
  last_char = nil
  string.each_char do |c|
    return true if c == last_char
    last_char = c
  end
  false
end

def nice_string?(string)
  return false if string.include? "ab"
  return false if string.include? "cd"
  return false if string.include? "pq"
  return false if string.include? "xy"
  unless vowel_count(string)
    #puts "vowel count is too low"
    return false
  end
  return false unless string_has_run? string

  true
end


def repeated_letter?(string)
  #find a pattern containing two letters, with zero or more other letters
  #between those two letters and another occurence of that letter
  #example: zxzx, aaasdfasdfasfdasdfaa
  /([a-z][a-z]).*\1/.match string
end

def pair_is_repeated?(string)
  #find a pattern where a letter is found on both sides of another letter
  #example: zxz, asdfd
  /([a-z])[a-z]\1/.match string
end

def nice_string_part2?(string)
  return true if repeated_letter?(string) and pair_is_repeated?(string)
  false
end

# test cases for part 1
puts "\n\n************************************"
puts "\tTesting part I"
puts "************************************"

case_1 = {name: "Case 1", key: "ugknbfddgicrmopnf", answer: true}
case_2 = {name: "Case 2", key: "aaa", answer: true}
case_3 = {name: "Case 3", key: "jchzalrnumimnmhp", answer: false}

test_cases = [case_1, case_2, case_3]

test_cases.each do |test_case|
  result = nice_string? (test_case[:key])
  if result == test_case[:answer]
    puts "test #{test_case[:name]} passes!"
  else
    puts "test #{test_case[:name]} fails"
  end
end


puts "\n\n************************************"
puts "\tString search part I"
puts "************************************"

# actual input part I
# result was 254575
text = File.open('input.txt').read()
nice_string_count = 0
text.gsub!(/\r\n?/, "\n")
text.each_line do |line|
  if nice_string? line
    nice_string_count += 1 
  end
end
puts "Found #{nice_string_count} nice strings"

# test cases for part 1
puts "\n\n************************************"
puts "\tTesting part II"
puts "************************************"

case_1 = {name: "Case 1", key: "qjhvhtzxzqq", answer: true}
case_2 = {name: "Case 2", key: "xxyxx", answer: true}
case_3 = {name: "Case 3", key: "uurcxstgmygtbstg", answer: false}
case_4 = {name: "Case 4", key: "ieodomkazucvgmuy", answer: false}

test_cases = [case_1, case_2, case_3, case_4]

test_cases.each do |test_case|
  result = nice_string_part2? test_case[:key]
  if result == test_case[:answer]
    puts "test #{test_case[:name]} passes!"
  else
    puts "test #{test_case[:name]} fails"
  end
end

puts "\n\n************************************"
puts "\tString search part II"
puts "************************************"

#actual result part II
# result was 1038736
#puts mine_answer("bgvyzdsv", 0, "000000", false)
#
#
nice_string_count = 0
text.gsub!(/\r\n?/, "\n")
text.each_line do |line|
  if nice_string_part2? line
    nice_string_count += 1 
  end
end
puts "Found #{nice_string_count} nice strings"
