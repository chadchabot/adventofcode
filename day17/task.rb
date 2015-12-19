containers = File.open("input.txt").read().split("\n").map(&:to_i)

limit = 150

#initially thinking just run through all the permutations of containers, but
#even printing them out takes forever.
#It's not a permutation that I want, it's all combinations of the inputs, but
#of varying sizes (that is, where we choose from [1..containers.length] items
#each time)

def count_container_combos(min_bucket_num, bucket_limit, limit, containers)
  num = 0
  num_buckets_used = []
  min_bucket_num.upto(bucket_limit).flat_map do |num_buckets|
    num_matches = containers.combination(num_buckets).find_all do |c|
      c.reduce(:+) == limit
    end.length
    if num_matches > 0
      num_buckets_used << num_buckets
    end
    num += num_matches
  end
  [num, num_buckets_used]
end

part1, buckets_used = count_container_combos(2, containers.length, limit, containers)

puts "********************"
puts "*  Part I answer:  *"
puts part1
puts "********************"


part2 = containers.combination(buckets_used.min).find_all {|bs| bs.reduce(:+) == limit }.length
puts "********************"
puts "*  Part II answer: *"
puts part2
puts "********************"
