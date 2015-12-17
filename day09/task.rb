class Link
  attr_reader :from
  attr_reader :to
  attr_reader :distance

  def initialize(from, to, distance)
    @from = from
    @to   = to
    @distance = distance.to_i
  end

  def ends(c1, c2)
    [c1,c2].include? @from and [c1,c2].include? @to
  end

  def to_s
    "#{@from} to: #{@to} = #{@distance}"
  end
end

def run1(input)
  cityList = []
  linkList = Array.new
  input.split("\n").each do |line|
    from, to, distance = *line.split(/ (to|=) /).values_at(0,2,4)
    linkList.push Link.new(from, to, distance)
    cityList.push from unless cityList.include? from
    cityList.push to   unless cityList.include? to
  end

  shortest_distance = 9999999999999999999
  shortest_path = nil
  cityList.permutation.each do |path|
    path_distance = 0
    curr_city = path[0]
    path[1..-1].each do |next_city|
      link = linkList.select {|link| link.ends(curr_city, next_city)}[0]
      path_distance += link.distance
      curr_city = next_city
    end
    #puts "#{path.to_a.join(" -> ")} = #{path_distance}"
    next if path_distance > shortest_distance
    shortest_distance = path_distance
    shortest_path = path

  end
  puts "#{shortest_path.to_a.join(" -> ")} = #{shortest_distance}"
  shortest_distance
end


text = File.open('input.txt').read()
result1 = run1(text)
puts result1



def run2(input)
  cityList = []
  linkList = Array.new
  input.split("\n").each do |line|
    from, to, distance = *line.split(/ (to|=) /).values_at(0,2,4)
    linkList.push Link.new(from, to, distance)
    cityList.push from unless cityList.include? from
    cityList.push to   unless cityList.include? to
  end

  longest_distance = 0
  longest_path = nil
  cityList.permutation.each do |path|
    path_distance = 0
    curr_city = path[0]
    path[1..-1].each do |next_city|
      link = linkList.select {|link| link.ends(curr_city, next_city)}[0]
      path_distance += link.distance
      curr_city = next_city
    end
    #puts "#{path.to_a.join(" -> ")} = #{path_distance}"
    next if path_distance < longest_distance
    longest_distance = path_distance
    longest_path = path

  end
  puts "#{longest_path.to_a.join(" -> ")} = #{longest_distance}"
  longest_distance
end


result2 = run2(text)
puts result2
