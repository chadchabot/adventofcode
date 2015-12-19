input = File.open('input.txt').read().split("\n")

def parse_input(lines)
  rules = []
  lines.each do |line|
    capacity, durability, flavour, texture, calories = line.scan /-?\d/
    h = {name: line.scan(/\w+/)[0].to_i, capacity: capacity.to_i, durability: durability.to_i, flavour: flavour.to_i, texture: texture.to_i, calories: calories.to_i}
    rules << h
  end
  rules
end


rules = parse_input(input)

def find_best_recipe(rules, cal_limit = nil)
  max = 0
  (1..100).each do |a|
    (1..100-a).each do |b|
      (1..100-a-b).each do |c|
        d = 100 - a - b - c

        capacity   = rules[0][:capacity] * a   + rules[1][:capacity] * b   + rules[2][:capacity] * c   + rules[3][:capacity] * d
        durability = rules[0][:durability] * a + rules[1][:durability] * b + rules[2][:durability] * c + rules[3][:durability] * d
        flavour    = rules[0][:flavour] * a    + rules[1][:flavour] * b    + rules[2][:flavour] * c    + rules[3][:flavour] * d
        texture    = rules[0][:texture] * a    + rules[1][:texture] * b    + rules[2][:texture] * c    + rules[3][:texture] * d
        calories   = rules[0][:calories] * a   + rules[1][:calories] * b   + rules[2][:calories] * c   + rules[3][:calories] * d

        totals = [capacity, durability, flavour, texture]
        if cal_limit and calories != 500
          score = 0
        elsif totals.any? {|n| n <= 0}
          score = 0
        else
          score = totals.inject(:*)
        end
        #puts "#{a} - #{b} - #{c} - #{d}"
        #puts "\t#{capacity} * #{durability} * #{flavour} * #{texture} = #{score}"
        max = score if score > max
      end
    end
  end
  max
end

part1 = find_best_recipe(rules)
part2 = find_best_recipe(rules, 500)

puts "Part I answer: #{part1}"
puts "Part II answer: #{part2}"
