require 'sorting'

module MergeSort
  include Sorting

  def merge_sort(arr)
    # Merge sort is pretty simple since it creates copies.
    # We simply split the array in half, sort each half, then merge
    # the two sorted halves.
    # This means T(n) = 2T(n/2) + O(n) -- (merge is O(n))
    # By the master method, a = 2, b = 2, d = 1 => a = b^d,
    # T(n) = O(n^dlogn) = O(nlogn).
    #
    # The base case is when the array is of size 0 or 1 in which case
    # it is vacuously sorted.
    
    # Since merge sort is guaranteed to return a new array (i.e.
    # leave the original array alone), we create a wrapper that starts
    # with a straight-up copy of the array and calls the helper to sort it.
    merge_sort_h(arr.dup)
  end

  private

  def merge_sort_h(arr)
    n = arr.size
    return arr if n < 2

    mid = n / 2
    l_sorted = merge_sort_h(arr.first(mid))
    r_sorted = merge_sort_h(arr.last(n - mid))
    
    merge(l_sorted, r_sorted)
  end

  def merge(arr1, arr2)
    # Merge two arrays into a new array of size arr1.size + arr2.size
    i = 0
    j = 0
    merged_arr = []
    while i < arr1.size || j < arr2.size
      if i >= arr1.size
        merged_arr.push(arr2[j])
        j += 1
      elsif j >= arr2.size
        merged_arr.push(arr1[i])
        i += 1
      elsif arr1[i] <= arr2[j]
        merged_arr.push(arr1[i])
        i += 1
      else # arr2[j] < arr1[j]
        merged_arr.push(arr2[j])
        j += 1
      end
    end

    merged_arr
  end
end
