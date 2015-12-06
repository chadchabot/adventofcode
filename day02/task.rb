
def get_box_dimensions(box_string)
  box_string.split('x').map(&:to_i).sort
end

def get_box_side_areas(length, width, height)
  [length * width, length * height, width * height].sort
end

def box_dimensions(box_size)
  total_area = 0

  length, width, height = get_box_dimensions( box_size )
  #puts "dimensions:\n\tlength: #{length}\n\twidth: #{width}\n\theight: #{height}"

  sides = get_box_side_areas( length, width, height)
  #puts "sides are: #{sides}, short side is: #{sides[0]}"
  sides.map! {|s| s * 2}

  sides[0]/2 + sides.reduce {|s,t| t += s}
end

def ribbon_length(box_size)
  sides = get_box_dimensions( box_size )
  bow_length = sides.reduce {|s,t| t *= s}

  smallest_perimeter = sides[0] * 2 + sides[1] * 2
  #puts "bow length: #{bow_length}, short side wrap: #{smallest_perimeter}"
  bow_length + smallest_perimeter
end


#test cases
case_1 = { raw: "2x3x4", correct_area: 58, correct_ribbon: 34}
case_2 = { raw: "1x1x10", correct_area: 43, correct_ribbon: 14}

tests = [case_1, case_2]

def test_box(box)
  puts "testing \"#{box}\""
  case_area = box_dimensions box[:raw]
  case_ribbon = ribbon_length box[:raw]
  puts "\tdimension test pass!" if case_area == box[:correct_area]
  puts "\tribbon length pass!"  if case_ribbon == box[:correct_ribbon]
end

tests.each {|box| test_box(box)}


input = File.open('input.txt').read()

total_area_required = 0
total_ribbon_length = 0

input.each_line do |box|
  total_area_required += box_dimensions(box)
  total_ribbon_length += ribbon_length(box)
end

puts total_area_required
puts total_ribbon_length
