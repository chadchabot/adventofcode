min_present_count = 29000000
#arrived at these startings point after trying a very rough and non-scientific
#binary search stargin with 1000000
house_num = 665000 
loop do
  number_of_presents = (1..house_num).select {|n| house_num % n == 0}.reduce(:+) * 10
  #puts "House ##{house_num} gets #{number_of_presents}"
  break if number_of_presents >= min_present_count
  house_num += 1
end

#puts elves.inspect
puts "House ##{house_num} received at least #{min_present_count}"

house_num = 705550
loop do
  number_of_presents = (1..house_num).select {|n| house_num % n == 0 and house_num/n <= 50}.reduce(:+) * 11
  puts "House ##{house_num} gets #{number_of_presents}"
  break if number_of_presents >= min_present_count
  house_num += 1
end

puts "House ##{house_num} received at least #{min_present_count}"
