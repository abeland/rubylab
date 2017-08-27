require 'sorting'

module CountInversions
  include Sorting

  def count_inversions(arr)
    # We use a modified merge sort in which both
    # the sorted array and the number of inversions
    # are returned. The number of inversions therefore
    # is the number of inversions in the left half of the array +
    # the number of inversions in the right half + the number of inversions
    # split across the two halves.

    merge_sort_with_num_inversions(arr.dup).first
  end

  private

  def merge(l, r)
    m = l.size
    n = r.size
    i = 0
    j = 0
    merged_arr = []
    num_inversions = 0

    while i < m || j < n
      if i >= m
        merged_arr.push(r[j])
        j += 1
      elsif j >= n
        merged_arr.push(l[i])
        i += 1
      elsif l[i] <= r[j]
        merged_arr.push(l[i])
        i += 1
      else # r[j] < l[i]
        merged_arr.push(r[j])
        j += 1
        # everything left in l is an invertion WRT r[j]
        num_inversions += m-i
      end
    end

    [num_inversions, merged_arr]
  end

  def merge_sort_with_num_inversions(arr)
    n = arr.size
    return [0, arr] if n < 2

    mid = n / 2
    n_inversions_l, sorted_l = merge_sort_with_num_inversions(arr.first(mid))
    n_inversions_r, sorted_r = merge_sort_with_num_inversions(arr.last(n - mid))

    n_split_inversions, sorted = merge(sorted_l, sorted_r)

    [n_split_inversions + n_inversions_l + n_inversions_r, sorted]
  end
end
