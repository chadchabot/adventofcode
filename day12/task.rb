require 'json'

haystack = File.open("input.txt").read()

def total_numbers(haystack)
  haystack.scan(/(-?\d+)/).flatten.map(&:to_i).reduce(:+)
end

puts "Part I answer: #{total_numbers(haystack)}"

#iterate through the parsed object, and if there are any properties with the
#value "red", delete that object
parsed_obj = JSON.parse(haystack)


def count(struct)
  case struct
  when Array
    struct.map { |s| count(s) }.inject(:+)
  when Hash
    struct.values.include?('red') ? 0 : count(struct.values)
  when Fixnum
    struct
  else
    0
  end
end


total = 0
parsed_obj.each do |obj|
  total += count(obj)
end
#101325 is too high
puts "Part II answer: #{total}"



