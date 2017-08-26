require 'sorting'

module QuickSort
  include Sorting

  def quick_sort(arr)
    # Quicksort is a brilliant in-place sorting algorithm with
    # worst case O(n^2) running time, but expected (average) O(nlogn) running time
    # (actually, you can make the stronger assertion of theta(nlogn) running time).
    # It works by partitioning the array into two parts (not necessarily of
    # equal length) around a pivot index i such that all elements to the left
    # of i are less than arr[i] and all elements to the right of i are at least
    # arr[i]. Then, we recursively sort the first part and the second part.
    # A full analysis and proof of the above mentioned runtime bounds is too
    # long for comments here, so I recommend consulting one of the many texts
    # which show proofs for these asymptotic run-time bounds for quicksort.
    quick_sort_h(arr, 0, arr.size-1)
  end

  private

  def quick_sort_h(arr, lo, hi)
    return unless lo < hi
    
    pivot_index = partition(arr, lo, hi)
    quick_sort_h(arr, lo, pivot_index-1)
    quick_sort_h(arr, pivot_index+1, hi)
  end
  
  def choose_pivot(arr, lo, hi)    
    (lo..hi).to_a.sample
  end

  def partition(arr, lo, hi)
    pivot_index = choose_pivot(arr, lo, hi)
    p = arr[pivot_index]
    swap(arr, lo, pivot_index)

    i = lo+1
    (i..hi).each do |j|
      if arr[j] < p
        swap(arr, i, j)
        i += 1
      end
    end
    swap(arr, lo, i-1)

    i-1
  end
end
