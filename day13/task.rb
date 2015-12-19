input = File.open('input.txt').read().split("\n")

#each line in input is a statement of form
#PERSON_A ... gain/lose POINTS ... PERSON_B
#

statements = []
people = []
input.each do |line|
  person, delta, partner = line[0..-2].sub(/ gain /, ' ').sub(/ lose /, ' -').split(" ").values_at(0,2,9)
  h = {person: person, units: delta.to_i, partner: partner}
  statements.push h
  people << person  unless people.include? person
  people << partner unless people.include? person
end

def score_pair(pair, rules)
  score = 0
  if pair.include? "Chad" #better this hack than searching fruitlessly for rules that don't exist
    0
  else
    score += rules.select {|r| r[:person] == pair[0] && r[:partner] == pair[1]}[0][:units]
    score += rules.select {|r| r[:person] == pair[1] && r[:partner] == pair[0]}[0][:units]
  end
end

def find_optimal_order(people, rules)
  high_score = 0

  people.permutation.each do |order|
    #figure out the units of happiness between each pairing
    score = 0
    order.each_cons(2) do |pair|
      score += score_pair(pair, rules)
    end
    #each_cons() doesn't allow for wrapping, so we've got to fake that
    score += score_pair([order[0], order[-1]], rules)

    high_score = score if score > high_score
  end
  high_score
end

#answer is 618
puts "Part I answer: #{find_optimal_order(people, statements)}"

#answer is 601
puts "Part I answer: #{find_optimal_order(people + ["Chad"], statements)}"


