require 'sorting'

module BubbleSort
  include Sorting

  def bubble_sort(arr)
    # The invariant in bubble sort is that after i iterations of the
    # outer loop, the last i elements are in their final position
    # in the fully-sorted array. Therefore, after i = n iterations
    # of the outer loop, the last i = n elements are in their final
    # sorted position, meaning the entire array is sorted.

    # Per Bubble Sort's invariant, after each ith iteration, the last i
    # elements will be in their final positions for the fully-sorted
    # array. Therefore, we only need (at most) i = arr.size iterations.
    arr.size.times do |i|
      # The swapped flag is an optimization: if there is no swap
      # among the first n - i (i.e. the inner loop), then we can break
      # out early.
      swapped = false

      # As aforementioned, the last i elements are already where they
      # need to be, so only consider the first n - i elements.
      # Indexing from 1 and comparing to the element before is
      # easier for me to keep track of, but you could also do:
      #
      # (0..(arr.size - i - 2)).each do |j|
      #   if arr[j] > arr[j+1]
      #     ...
      #
      (1..(arr.size - i - 1)).each do |j|
        if arr[j-1] > arr[j]
          swap(arr, j-1, j)
          swapped = true
        end
      end

      # As aforementioned, if the inner loop resulted in no swaps,
      # it means they are all ordered, and thus sorted. In addition,
      # the last i elements are in their final sorted positions so
      # any further loops would be useless: this array is fully sorted.
      break unless swapped
    end
  end
end

