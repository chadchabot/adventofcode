#!/bin/ruby

file = File.open('input.txt').read

lines = file.split("\n").map do |line|
  o = line.split(" ")
  {ord: o[0], rest: o[1..-1].join(" ")}
end

#sort the lines based on length of ord
#lines.sort! {|a,b| a[:ord] <=> b[:ord]}
lines.sort! do |a,b|
  a[:ord] <=> b[:ord]
end

single_letters = lines.select {|e| e[:ord].length == 1}
double_letters = lines.reject {|e| e[:ord].length == 1}

sorted_output = single_letters[1..-1] + double_letters + single_letters[0..0]


sorted_output.map! do |h|
  "#{h[:ord]} #{h[:rest]}"
end

puts sorted_output

outfile = File.open('eval.py', 'w')

sorted_output.each do |line|
  outfile.write line + "\n"
end

#then eval the python file line-by-line and print a
# a = 46065
#
#for part 2, take eval.py, and set b = 46065
# a = 14134
