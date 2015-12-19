def is_valid_password?(password, debug = false)
  unless password.length == 8
    puts "\tlength is wrong" if debug
    return false
  end
  if password.match /[iol]/
    puts "\tcontains one of [i,o,l]" if debug
    return false
  end
  unless password.scan(/(\w)\1/).uniq.size > 1
    puts "\tno two letter doubles" if debug
    return false
  end
  unless password.match /(abc|bcd|cde|def|efg|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop|opq|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz)/
    puts "\tno 3 letter run found" if debug
    return false
  end
  true
end

def run(input, debug = false)
  input.succ!
  until is_valid_password?(input, debug)
    puts "trying [#{input}]" if debug
    input.succ!
  end
  input
end

case_1 = {input: 'hijkl', next_pass: false}
case_2 = {input: 'hijklmmn', next_pass: false}
case_3 = {input: 'abbceffg', next_pass: false}
case_4 = {input: 'abbcegjk', next_pass: false}
case_5 = {input: 'abcdefgh', next_pass: "abcdffaa"}
case_6 = {input: 'ghijklmn', next_pass: "ghjaabcc"}

test_cases = [case_5, case_6]

test_cases.each do |test|
  result = run(test[:input])
  if result == test[:next_pass]
    puts "test passes!"
  else
    puts "test fails!"
    puts "[#{result}] != [#{test[:next_pass]}]"
  end
end

password1 = "hepxcrrq"
next1 = run(password1)

password2 = next1.succ
next2 = run(password2)

puts "part I: [#{next1}]"
puts "partII: [#{next2}]"

