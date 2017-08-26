require 'sorting'

module SelectionSort
  include Sorting

  def selection_sort(arr)
    # In selection sort, for each outer loop iteration i, we are
    # *selecting* the ith *statistic* of the array and placing
    # it into index i. Therefore, after i=n iterations, each
    # index i in the array has the ith stastic of the array and
    # therefore it is fully sorted.
    # To do this, we observe that on the ith iteration, the first i-1
    # statistics have been placed into the first i-1 indices, and therefore
    # the ith statistic of the array is the 0th statistic of the array suffix
    # from index i onwards. This is what the inner loop finds.
    (0..(arr.size-1)).each do |i|
      # Find the "0th" statistic in the array from i onwards.
      # That element will go into index i.
      min_idx = i
      ((i+1)..(arr.size-1)).each do |j|
        min_idx = j if arr[j] < arr[min_idx]
      end
      swap(arr, i, min_idx)
    end

    nil
  end
end
