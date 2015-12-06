# keep a bucket of locations in {x,y} format, with number of visits associated
# with that location/coords


def first_visit(coords)
  return {x: coords[:x], y: coords[:y], visit_count: 1}
end

def log_path(path)
  current_position = {x: 0, y:0}
  visited_locations = [{x: 0, y: 0, visit_count: 1}]

  path.each_char do |c|
    case c
      when '^'
        current_position[:y] += 1
      when 'v'
        current_position[:y] -= 1
      when '<'
        current_position[:x] -= 1
      when '>'
        current_position[:x] += 1
    end
    existing_location = visited_locations.find do |loc|
      #puts "searching for #{current_position} in #{visited_locations}"
      loc[:x] == current_position[:x] and loc[:y] == current_position[:y]
    end

    if existing_location
      #puts "already visited #{current_position}"
      #puts "existing location: #{existing_location}"
      existing_location[:visit_count] += 1
    else
      #puts "first visit to #{current_position}"
      visited_locations << first_visit(current_position)
    end
  end

  #puts visited_locations
  #puts visited_locations.count
  visited_locations.count
end
directions = File.open('input.txt').read()
puts "Santa visited #{log_path(directions)} houses"

# test cases for part 1

case_1 = {directions: "^v^v^v^v^v", house_count: 2}
case_2 = {directions: "^>v<", house_count: 4}
case_3 = {directions: ">", house_count: 2}

test_cases = [case_1, case_2, case_3]

test_cases.each do |test_case|
  result = log_path test_case[:directions]
  if result == test_case[:house_count]
    puts "test passes!"
  else
    puts "test fails"
  end
end


def log_split_path(path)
  #this time, use a shared location list between santa and robo-santa
  santa_position      = {x: 0, y:0, name: "santa"}
  robo_santa_position = {x: 0, y:0, name: "robo"}
  santas = [santa_position, robo_santa_position]

  visited_locations = [{x: 0, y: 0, visit_count: 1}]

  path.split("").each_with_index do |c, idx|
    mover = santas[idx % 2]
    case c
      when '^'
        mover[:y] += 1
      when 'v'
        mover[:y] -= 1
      when '<'
        mover[:x] -= 1
      when '>'
        mover[:x] += 1
    end
    #puts "#{mover[:name]} visiting #{mover[:x]}, #{mover[:y]}"
    existing_location = visited_locations.find do |loc|
      #puts "searching for #{current_position} in #{visited_locations}"
      loc[:x] == mover[:x] and loc[:y] == mover[:y]
    end

    if existing_location
      #puts "already visited #{current_position}"
      #puts "existing location: #{existing_location}"
      existing_location[:visit_count] += 1
    else
      #puts "first visit to #{current_position}"
      visited_locations << first_visit(mover)
    end
  end

  #puts visited_locations.sort_by {|loc| loc[:visit_count] }

  sorted_by_x = visited_locations.sort_by {|loc| loc[:x] }
  sorted_by_y = visited_locations.sort_by {|loc| loc[:y] }

  puts sorted_by_x.first
  puts sorted_by_x.last
  puts sorted_by_y.first
  puts sorted_by_y.last
  #puts visited_locations.count
  visited_locations.count
end

# test cases for part 2

puts "\n\n************************************"
puts "\tTesting part II"
puts "************************************"

case_1 = {directions: "^v", house_count: 3}
case_2 = {directions: "^>v<", house_count: 3}
case_3 = {directions: "^v^v^v^v^v", house_count: 11}

test_cases = [case_1, case_2, case_3]

test_cases.each do |test_case|
  result = log_split_path test_case[:directions]
  if result == test_case[:house_count]
    puts "test passes!"
  else
    puts "test fails"
  end
end

directions = File.open('input.txt').read()
puts "Santa & Robo-Santa visited #{log_split_path(directions)} houses"
