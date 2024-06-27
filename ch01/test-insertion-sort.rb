#!/usr/bin/ruby -w
#    Hey, Emacs, this is a -*- Mode: Ruby -*- file!
#
#    File:
#       test-insertion-sort.rb
#
#    Synopsis:
#
#
#    Revision History:
#        Date             Change Description
#       ------ -----------------------------------------
#       240514 Original.

require './ch01'
require 'test/unit'

def random_ordered_array
  low = Random.rand(200)
  high = low + Random.rand(100)

  a = []
  low.upto(high) do |i|
    a.push(i)
  end

  a
end

class TestInsertionSort < Test::Unit::TestCase
  def test_insertion_sort
    assert([] == insertion_sort([]), "Sorting empty array failed.")
    assert([10] == insertion_sort([10]), "Sorting single-element array failed.")
    assert([10, 20] == insertion_sort([10, 20]),
           "Sorting ordered two-element array failed.")
    assert([10, 20] == insertion_sort([20, 10]),
           "Sorting reversed two-element array failed.")

    #    This does not guarantee stable sort!
    #    Ruby: 1.0 == 1 => true
    #    But this is the behavior:
    #    insertion_sort([3.0, 1, 2, 3, 1.0]) => [1, 1.0, 2, 3.0, 3]
    assert([1, 1.0, 2, 3.0, 3] == insertion_sort([3.0, 1, 2, 3, 1.0]),
           "Stable sort failed.")

    assert([1, 2, 3, 4, 5] == insertion_sort([1, 2, 3, 4, 5]),
           "Sorting ordered array failed.")
    assert([1, 2, 3, 4, 5] == insertion_sort([5, 4, 3, 2, 1]),
           "Sorting reversed ordered array failed.")

    a = [61, 82, 67, 4, 98, 20, 37, 85]
    assert([4, 20, 37, 61, 67, 82, 85, 98] == insertion_sort(a),
           "Sorting book example failed.")

    100.times do
      a = random_ordered_array
      b = a.shuffle

      assert(a == insertion_sort(b), "Sorting shuffled array failed.")
    end
  end

  def test_insertion_sort2
    assert([] == insertion_sort2([]), "Sorting empty array failed.")
    assert([10] == insertion_sort2([10]), "Sorting single-element array failed.")
    assert([10, 20] == insertion_sort2([10, 20]),
           "Sorting ordered two-element array failed.")
    assert([10, 20] == insertion_sort2([20, 10]),
           "Sorting reversed two-element array failed.")

    #    This does not guarantee stable sort!
    #    Ruby: 1.0 == 1 => true
    #    But this is the behavior:
    #    insertion_sort2([3.0, 1, 2, 3, 1.0]) => [1, 1.0, 2, 3.0, 3]
    assert([1, 1.0, 2, 3.0, 3] == insertion_sort2([3.0, 1, 2, 3, 1.0]),
           "Stable sort failed.")

    assert([1, 2, 3, 4, 5] == insertion_sort2([1, 2, 3, 4, 5]),
           "Sorting ordered array failed.")
    assert([1, 2, 3, 4, 5] == insertion_sort2([5, 4, 3, 2, 1]),
           "Sorting reversed ordered array failed.")
    assert([5, 4, 3, 2, 1] == insertion_sort2([1, 2, 3, 4, 5], test: ->(x, y) {x > y}),
           "Sorting ordered array failed.")
    assert([5, 4, 3, 2, 1] == insertion_sort2([5, 4, 3, 2, 1], test: ->(x, y) {x > y}),
           "Sorting reversed ordered array failed.")

    a = [61, 82, 67, 4, 98, 20, 37, 85]
    assert([4, 20, 37, 61, 67, 82, 85, 98] == insertion_sort2(a),
           "Sorting book example failed.")

    assert(["pung", "foo", "baz", "bar"] == insertion_sort2(["pung", "foo", "bar", "baz"], test: ->(a, b) {a > b}),
           "Sorting strings in descending order failed.")

    assert(["Pung", "FOO", "baz", "BAR"] == insertion_sort2(["Pung", "FOO", "BAR", "baz"], test: ->(a, b) {a.casecmp(b).positive?}),
           "Case-insensitive sorting strings in descending order failed.")

    assert(["bar", "baz", "foo", "pung"] == insertion_sort2(["pung", "foo", "bar", "baz"], test: ->(a, b) {a < b}),
           "Sorting strings in ascending order failed.")

    assert(["BAR", "baz", "Foo", "pUNG"] == insertion_sort2(["pUNG", "Foo", "BAR", "baz"], test: ->(a, b) {a.casecmp(b).negative?}),
           "Case-insensitive sorting strings in ascending order failed.")

    assert(["foo", "bar", "baz"] == insertion_sort2(["foo", "bar", "baz"], test: ->(a, b) {a.length < b.length}),
           "Sorting strings by length should be stable (ascending).")

    assert(["foo", "bar", "baz"] == insertion_sort2(["foo", "bar", "baz"], test: ->(a, b) {a.length > b.length}),
           "Sorting strings by length should be stable (descending).")

    assert([[:z, 2], [:k, 3], [:p, 4], [:a, 5], [:b, 9]] == insertion_sort2([[:a, 5], [:b, 9], [:k, 3], [:p, 4], [:z, 2]], test: ->(a, b) {a[1] < b[1]}),
           "Complex sorting criteria are observed.")

    assert([[:a, 5], [:b, 9], [:k, 3], [:p, 4], [:z, 2]] == insertion_sort2([[:b, 9], [:a, 5], [:k, 3], [:p, 4], [:z, 2]], test: ->(a, b) {a[0] < b[0]}),
           "Complex sorting criteria are observed.")

    100.times do
      a = random_ordered_array
      b = a.shuffle

      assert(a == insertion_sort2(b), "Sorting shuffled array failed.")
    end
  end
end
