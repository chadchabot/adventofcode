#sample rules
rule_1 = {s: "H", e: "HO"}
rule_2 = {s: "H", e: "OH"}
rule_3 = {s: "O", e: "HH"}
test_rules = [rule_1, rule_2, rule_3]

#sample molecules
test_string = "HOH"

def make_replacements(source, rules)
  out_strings = []
  #puts "Looking at [#{test_string}]"
  rules.each do |rule|
    #puts "\ttesting #{rule.inspect}"
    l = rule[:s].length
    (0..source.length - 1 - (l -1)).each do |idx|
      #puts "testing [#{source[idx..-1]}]"
      if source[idx,l] == rule[:s]
        left_half  = source[0,idx]
        right_half = source[idx + l..-1]
        new_str = left_half + rule[:e] + right_half
        #puts "\t#{source} => #{new_str} after replacing [#{rule[:s]}] with [#{rule[:e]}] at index #{idx}"
        out_strings << new_str
      end
    end
    #puts "----------------------"
  end
  out_strings.uniq
end

result = make_replacements(test_string, test_rules)
puts "=========================="
puts "Testing results:"
puts result
puts "=========================="

rules = File.open("rules.txt").read().split("\n").map do |r|
  from, to = r.split(" => ")
  {s: from, e: to}
end

molecule = File.open("molecule.txt").read()

part1 = make_replacements(molecule, rules)
puts "=========================="
puts "Part I results:"
puts "There are #{part1.length} different unique outcomes after one round of replacements"
puts "=========================="


#part2 = make_replacements(molecule, rules)
puts "=========================="
puts "Part II results:"
#puts "There are #{part1.length} different unique outcomes after one round of replacements"
puts "=========================="

#we want to go from e => molecule.
# since we know both ends of the problem, we will start from one end and work
# out way to the other.
#
#Starting from the end and working backwards seems more likely to result in the
#shortest number of steps.
#We need to reverse the order that the rules are applied, in that we search for
#rule[:e] and replace it with rule[:s]

t2_rule_1 = {s: 'e', e: 'H'}
t2_rule_2 = {s: 'e', e: 'O'}
t2_rule_3 = {s: 'H', e: 'HO'}
t2_rule_4 = {s: 'H', e: 'OH'}
t2_rule_5 = {s: 'O', e: 'HH'}

t2_rules = [t2_rule_1, t2_rule_2, t2_rule_3, t2_rule_4, t2_rule_5]

t2_start = 'e'
t2_end   = 'HOH'

#start -> e
#   apply rule 1
# e -> H
#   apply rule 3
# H -> HO
#   apply rule 5
# HO -> HOH
#
#
grouped_rules = File.open("rules_grouped.txt").read().split("\n").map do |rule|
  start, endings = rule.split(" => ")
  endings = endings.split(" | ")
  {s: start, e: endings}
end

class Node
  attr_reader :value, :children

  def initialize(value)
    @value = value
    @children = [] #a list of nodes
  end

  def add_child(node)
    @children << node
  end

end

starting_node = Node.new(molecule)

puts starting_node.inspect
