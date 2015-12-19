def run1(input, num_times)
  test_string = input
  num_times.times do |i|
    puts "#{i}"
    test_string.gsub!(/(\d)\1*/) {|m| "#{m.length}#{m[0]}"}
  end
  test_string
end

def lookAndSay(str)
  prev = ""
  curr = str[0]
  ch_count = 0
  out_str = ""

  str.each_char do |x|
    #puts "#{ch} -- #{ch_count} -- #{tmp_ch} -- [#{out_str}]"
    if x != curr
      prev = curr
      curr = x
      out_str << ch_count.to_s
      out_str << x
      ch_count = 0
    end
    ch_count += 1
  end

  out_str << ch_count.to_s
  out_str << curr
end

def run2(input)
end

case_1 = {input:"1", answer:"11"}
case_2 = {input:"11", answer:"21"}
case_3 = {input:"21", answer:"1211"}
case_4 = {input:"1211", answer:"111221"}
case_5 = {input:"111221", answer:"312211"}

test_cases = [case_1, case_2, case_3, case_4, case_5]

test_cases.each do |test|
  result = run1(test[:input], 1)
  if result == test[:answer]
    puts "test passes!"
  else
    puts "test fails!"
    puts "[#{result}] != [#{test[:answer]}]"
  end
end

text = File.open('input.txt').read().split("\n")[0]
#result1 = run1(text, 40)
#puts result1.length

result2 = run1(text, 50)
puts result2.length


