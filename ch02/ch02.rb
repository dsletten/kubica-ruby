#!/usr/bin/ruby -w
#    Hey, Emacs, this is a -*- Mode: Ruby -*- file!
#
#    File:
#       ch02.rb
#
#    Synopsis:
#
#
#    Revision History:
#        Date             Change Description
#       ------ -----------------------------------------
#       240609 Original.

def binary_search(a, target, test: ->(x, y) {x < y})
  low = 0
  high = a.size - 1

  while low <= high
    mid = (low + high) / 2
    current = a[mid]

    if test.call(current, target)
      low = mid + 1
    elsif test.call(target, current)
      high = mid - 1
    else
      return mid
    end
  end

  -1
end
