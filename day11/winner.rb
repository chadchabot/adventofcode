s = "hepxcrrq"

#WUT?
r = Regexp.union [*?a..?z].each_cons(3).map(&:join)
# build a regexp object that will match any of the parts given as an argument
# [*?a..?z]
  # create an array of all letters between a & z
# .each_cons(3)
  # and take every grouping of 3 consecutive elements
# .map(&:join)
  # then join them all into an array

s.succ! until s[r] && s !~ /[iol]/ && s.scan(/(.)\1/).size > 1
p s
