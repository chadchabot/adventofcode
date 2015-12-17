def run1(input)
  commands = transform_commands input
  commands = sort_commands commands


  puts commands
end

def sort_commands(commands)
  assignments = commands.select {|command| /= \d+$/.match command[:command]}
  one_letter  = (commands - assignments).select {|command| command[:ord].length == 1 and command[:ord] != 'A'}
  two_letter  = commands.select {|command| command[:ord].length != 1}
  final_test  = commands.select {|command| command[:ord] == 'A'}

  hash_sort(assignments) + hash_sort(one_letter) + hash_sort(two_letter) + final_test
end

def hash_sort(hash)
  hash.sort {|a,b| a[:ord] <=> b[:ord]}
end

def transform_commands(commands)
  translations = {
    'AND'    => '&',
    'OR'     => '|',
    'NOT'    => '~',
    'LSHIFT' => '<<',
    'RSHIFT' => '>>'
  }

  commands.
    map {|command| command.gsub(Regexp.union(translations.keys), translations).upcase}.
    map {|command| command.split(" -> ").reverse.join(" = ")}.
    map do |command|
      parts = command.split("=")
      {ord: parts[0].strip, command: command}
    end
end

# test cases for part 1
puts "\n\n************************************"
puts "\tTesting part I"
puts "************************************"

steps = [
  "123 -> x",
  "456 -> y",
  "x AND y -> d",
  "x OR y -> e",
  "x LSHIFT 2 -> f",
  "y RSHIFT 2 -> g",
  "NOT x -> h",
  "NOT y -> i"
]

case_1 = {name: "Case 1", key: steps, answer: {d: 72, e: 507, f: 492, g: 114, h: 65412, i: 65079, x: 123, y: 456} }

test_cases = []
test_cases = [case_1]

test_cases.each do |test_case|
  result = run1(test_case[:key])
  puts "result:"
  puts result
  puts "answer:"
  puts test_case[:answer]
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
result = run1(text.split("\n"))

