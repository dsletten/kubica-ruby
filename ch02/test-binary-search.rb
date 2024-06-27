#!/usr/bin/ruby -w
#    Hey, Emacs, this is a -*- Mode: Ruby -*- file!
#
#    File:
#       test-binary-search.rb
#
#    Synopsis:
#
#
#    Revision History:
#        Date             Change Description
#       ------ -----------------------------------------
#       240609 Original.

require './ch02'
require 'test/unit'

class TestBinarySearch < Test::Unit::TestCase
  def test_binary_search
    a = [-5, -1, 0, 3, 9, 11, 15, 17, 30, 35, 51, 54]

    assert(0 == binary_search(a, -5))
    assert(3 == binary_search(a, 3))
    assert(4 == binary_search(a, 9))
    assert(8 == binary_search(a, 30))
    assert(11 == binary_search(a, 54))
    assert(-1 == binary_search(a, -8))
    assert(-1 == binary_search(a, 12))
    assert(-1 == binary_search(a, 60))

    a = a.reverse
    test = ->(x, y) {x > y}

    assert(0 == binary_search(a, 54, test: test))
    assert(3 == binary_search(a, 30, test: test))
    assert(4 == binary_search(a, 17, test: test))
    assert(8 == binary_search(a, 3, test: test))
    assert(11 == binary_search(a, -5, test: test))
    assert(-1 == binary_search(a, -8, test: test))
    assert(-1 == binary_search(a, 12, test: test))
    assert(-1 == binary_search(a, 60, test: test))

    a = ["Clojure", "java", "JavaScript", "LISP", "Prolog", "ruby"]
    test = ->(a, b) {a.casecmp(b).negative?}

    assert(0 == binary_search(a, "clojure", test: test))
    assert(1 == binary_search(a, "Java", test: test))
    assert(2 == binary_search(a, "JAVASCRIPT", test: test))
    assert(3 == binary_search(a, "Lisp", test: test))
    assert(4 == binary_search(a, "prolog", test: test))
    assert(5 == binary_search(a, "Ruby", test: test))
    assert(-1 == binary_search(a, "C#", test: test))
  end
end
