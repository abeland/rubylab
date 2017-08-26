require 'sorting'

module InsertionSort
  include Sorting

  def insertion_sort(arr)
    # In insertion sort, we move left-to-right in the array,
    # "inserting" the newly-encountered element into the correct
    # position among the already-seen elements (i.e. the first i
    # elements). Therefore, after n outer loop iterations, all
    # the elements of the array have been visited and inserted
    # into their final position among the first i = n elements,
    # meaning the array is fully sorted.
    #
    # Again, the invariant here is that after i iterations,
    # the first i elements are sorted.
    #
    # Therefore, after i = n iterations, the first n elements are
    # sorted, which means the full array is sorted.

    # We begin from i = 1 because we are moving downwards towards the
    # beginning of the array so the 0th element would have nothing to
    # compare to.
    (1..(arr.size - 1)).each do |i|
      # We're going to pick the j=ith element and move it down
      # (i.e. "insert" it) into the right position among the first i
      # elements.
      j = i
      while j > 0 && arr[j] < arr[j-1]
        swap(arr, j-1, j)
        j -= 1
      end
    end

    nil
  end
end
