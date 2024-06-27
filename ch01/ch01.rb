#!/usr/bin/ruby -w
#    Hey, Emacs, this is a -*- Mode: Ruby -*- file!
#
#    File:
#       ch01.rb
#
#    Synopsis:
#
#
#    Revision History:
#        Date             Change Description
#       ------ -----------------------------------------
#       240514 Original.

def insertion_sort(a)
  n = a.length

  1.upto(n-1) do |i|
    current = a[i]
    j = i - 1

    until j < 0  ||  a[j] <= current
      a[j+1] = a[j]
      j -= 1
    end

    a[j+1] = current
  end

  a
end

def insertion_sort2(a, test: ->(x, y) {x < y})
  n = a.length

  1.upto(n-1) do |i|
    current = a[i]
    j = i - 1

    until j < 0  ||  !test.call(current, a[j])
      a[j+1] = a[j]
      j -= 1
    end

    a[j+1] = current
  end

  a
end
