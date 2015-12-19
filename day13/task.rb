input = File.open('input.txt').read().split("\n")

#each line in input is a statement of form
#PERSON_A ... gain/lose POINTS ... PERSON_B
#

#build rules
def build_rules(input)
  statements = []
  people = []
  input.each do |line|
    person, delta, partner = line[0..-2].sub(/ gain /, ' ').sub(/ lose /, ' -').split(" ").values_at(0,2,9)
    h = {person: person, units: delta.to_i, partner: partner}
    statements.push h
    people << person  unless people.include? person
    people << partner unless people.include? person
  end
  return [statements, people]
end

rules, people = build_rules(input)

def simplify_rules(people, rules)
  new_rules = []
  people.permutation.each do |order|
    order.each_cons(2) do |pair|
      if new_rules.select {|r| r[:people] == pair}.empty?
        net_impact  = rules.select {|r| r[:person] == pair[0] && r[:partner] == pair[1]}[0][:units]
        net_impact += rules.select {|r| r[:person] == pair[1] && r[:partner] == pair[0]}[0][:units]
        h = {people: pair, impact: net_impact}
        new_rules << h
      end
    end
  end
  new_rules
end
#rules could be streamlined so that every pairing is reduced to a single number
#that is the cumulative impact on happiness

rules = simplify_rules(people, rules)

def score_pair(pair, rules)
  score = 0
  if pair.include? "Chad" #better this hack than searching fruitlessly for rules that don't exist
    0
  else
    score += rules.select {|r| r[:person] == pair[0] && r[:partner] == pair[1]}[0][:units]
    score += rules.select {|r| r[:person] == pair[1] && r[:partner] == pair[0]}[0][:units]
  end
end

def score_pair2(pair, rules)
  if pair.include? "Chad" #better this hack than searching fruitlessly for rules that don't exist
    0
  else
    rules.select {|r| r[:people] == pair}[0][:impact]
  end
end

def find_optimal_order(people, rules)
  high_score = -Float::INFINITY

  people.permutation.each do |order|
    #figure out the units of happiness between each pairing
    score = 0
    order.each_cons(2) do |pair|
      #score += score_pair(pair, rules)
      score += score_pair2(pair, rules)
    end
    #each_cons() doesn't allow for wrapping, so we've got to fake that
    score += score_pair2([order[0], order[-1]], rules)

    high_score = score if score > high_score
  end
  high_score
end

#answer is 618
puts "Part I answer: #{find_optimal_order(people, rules)}"

#answer is 601
puts "Part I answer: #{find_optimal_order(people + ["Chad"], rules)}"


