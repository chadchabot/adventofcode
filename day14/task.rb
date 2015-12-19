input = File.open("input.txt").read().split("\n")

def build_rules(input)
  rules = []
  input.each do |line|
    name, speed, duration, rest_duration = line.split(" ").values_at(0,3, 6, 13)
    rule = {name: name, speed: speed.to_i, duration: duration.to_i, rest_duration: rest_duration.to_i}
    rules << rule
  end
  rules
end

rules = build_rules(input)

def distance_at_time(rules, time)
  output = []
  rules.each do |rule|
    distance_per_burst = rule[:speed] * rule[:duration]
    time_per_burst = rule[:duration] + rule[:rest_duration]
    num_full_cycles = time / time_per_burst
    remainder_time = time % time_per_burst

    distance = num_full_cycles * distance_per_burst
    distance += rule[:speed] * (remainder_time >= rule[:duration] ? rule[:duration] : remainder_time)

    o = {name: rule[:name], distance: distance.to_i}
    output << o
  end
  output
end

results = distance_at_time(rules, 2503)

results.sort! {|a,b| b[:distance] <=> a[:distance]}

puts "Part I answer: #{results[0]}"


#for part II we need to track state, and know the state after every second

def score_at_time(rules, seconds)
  state = []
  state = build_state(rules)
  leader = state[0]
  puts state
  seconds.times do
    state.each do |deer|
      if deer[:flying]
        deer[:position] += deer[:speed]
      end
      deer[:state_change_timer] -= 1

      if deer[:state_change_timer] == 0
        deer[:flying] = !deer[:flying]
        if deer[:flying]
          deer[:state_change_timer] = deer[:duration]
        else
          deer[:state_change_timer] = deer[:rest_duration]
        end
      end
      if deer[:position] > leader[:position]
        leader = deer
      end
    end
    leader[:points] += 1
  end
  state
end

def build_state(rules)
  rules.each do |rule|
    rule[:points] = 0
    rule[:flying] = true
    rule[:state_change_timer] = rule[:duration]
    rule[:position] = 0
  end
  rules
end

state = score_at_time(rules, 2503)
puts state
puts "*******************"
puts "Part II winner:"
puts state.sort {|a,b| b[:points] <=> a[:points]}[0]
