require 'digest/md5'

def mine_answer(secret_key, starting_value, success_condition, silence = true)
  idx = starting_value
  while true do
    if idx % 1000 == 0
      puts "Trying #{idx}+" unless silence
    end
    puts "trying [#{secret_key}#{idx}]" unless silence
    idx += 1
    result = Digest::MD5.hexdigest("#{secret_key}#{idx}")
    if result[0,success_condition.length] == success_condition
      puts "\a" unless silence
      return idx
    end
  end
end

# test cases for part 1
puts "\n\n************************************"
puts "\tTesting part I"
puts "************************************"

case_1 = {name: "Case 1", key: "abcdef", answer: 609043, starting_val: 609000}
case_2 = {name: "Case 2", key: "pqrstuv", answer: 1048970, starting_val: 1048900}

test_cases = [case_1, case_2]

test_cases.each do |test_case|
  result = mine_answer(test_case[:key], test_case[:starting_val], "00000")
  if result == test_case[:answer]
    puts "test #{test_case[:name]} passes!"
  else
    puts "test #{test_case[:name]} fails"
  end
end


puts "\n\n************************************"
puts "\tMining part I"
puts "************************************"

# actual input part I
# result was 254575
puts mine_answer("ckczppom", 0, "00000")

puts "\n\n************************************"
puts "\tMining part II"
puts "************************************"

#actual result part II
# result was 1038736
puts mine_answer("ckczppom", 0, "000000")
