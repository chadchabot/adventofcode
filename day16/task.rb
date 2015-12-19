clues = File.open("clues.txt").read().split("\n").map do |c|
  # all of this juggling is silly
  key, value = c.split(": ")
  h = {}
  h[key.to_sym] = value
  h
end

aunts = File.open("input.txt").read().split("\n").map do |aunt|
  a = {}
  keys_split = aunt.index(":")
  a[:num] = aunt[4..keys_split-1]
  aunt[keys_split+2..-1].split(", ").map {|e| e.split(": ") }.each do |entry|
    a[entry[0].to_sym] = entry[1]
  end
  a
end


#find the aunt with the best fit based on the clues
def part1(clues, aunts)
  result = Array.new aunts
  clues.each do |clue|
    #filter aunts that do not match the key:value in clue
    key = clue.keys.first
    result.reject! {|a| a.has_key? key and clue[key] != a[key] }

    #puts "Using #{key} as the filter, there are now #{aunts.length} remaining possibilities"
  end
  result[0]
end

puts "********************"
puts "*  Part I answer:  *"
part1 = part1(clues, aunts)
puts part1[:num]
puts "********************"

#find the aunt with the best fit based on the clues
def part2(clues, aunts)
  result = Array.new aunts
  clues.each do |clue|
    #filter aunts that do not match the key:value in clue
    key = clue.keys.first
    result.reject! do |a|
      a.has_key? key and retroencabulation(key, clue[key], a[key])
    end

    #puts "Using #{key} as the filter, there are now #{aunts.length} remaining possibilities"
  end
  result[0]
end

def retroencabulation(key, value, test_value)
  case key
  when :cats, :trees
    value >= test_value
  when :goldfish, :pomeranians
    value <= test_value
  else
    value != test_value
  end
end

puts "********************"
puts "*  Part II answer: *"
part2 = part2(clues, aunts)
puts part2[:num]
puts "********************"
