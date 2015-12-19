## Day 11

From looking at one of the reported "winning" entries, after brute forcing my
own hacks, I learned a few things about the Regexp object.

For example, creating multiple patterns to match in a single statement:

  r = Regexp.union [*?a..?z].each_cons(3).map(&:join)
  # build a regexp object that will match any of the parts given as an argument
  # [*?a..?z]
    # create an array of all letters between a & z
  # .each_cons(3)
    # and take every grouping of 3 consecutive elements
  # .map(&:join)
    # then join them all into an array


Some more of the differences between match & scan

String manipulation with the `.succ` & `.next` methods was very interesting
