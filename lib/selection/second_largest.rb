module SecondLargest
  def second_largest(arr)
    # The most efficient way to select the second largest element of an array. Not super
    # practical, but a good exercise in runtime analysis.
    #
    # First, realize that there is an asymptotically just-as-good solution that is much simpler:
    #
    #   def second_largest(arr)
    #     return nil unless arr.size >= 2
    #     max_idx = nil
    #     arr.each_with_index do |elem, i|
    #       max_idx = i if max_idx.nil? || arr[i] > arr[max_idx]
    #     end
    #
    #     second_largest = nil
    #     arr.each_with_index do |elem, i|
    #       next if i == max_idx
    #       second_largest = elem if second_largest.nil? || elem > second_largest
    #     end
    #
    #     second_largest
    #   end
    #
    # The fancy approach (which again, is really not necessary IRL) is to divide and conquer:
    #
    #   I. Create a helper function h which:
    #      1. Splits the array into two equally(ish, if the array is odd-sized)-sized arrays a,b
    #      2. Recursively call h on a and b to get two 2-tuples, where the first element of the tuple
    #         is the largest element in the array, and the second element is the rest of the array.
    #      3. Without loss of generality, if the largest element in a is greater than the largest
    #         element in b, then we know that the second largest element must either be in the
    #         elements in a minus the largest element in a *or* the largest element of b. To see this,
    #         assume the contrary, namely that there is an element in the rest of b which is the
    #         largest overall element in the array. The largest element in a is larger and so is
    #         the largest element in b, a contradiction.
    #      4. Return the 2-tuple (largest in a, rest of a + largest in b)
    #
    #  II. Create a wrapper function f which calls h:
    #
    #      1. Do n-2 comparisons to the find the max in the second element of the 2-tuple from h
    #         which is therefore the second-largest element overall in the array.

    return nil if arr.size < 2

    _, rest = second_largest_h(arr)
    # There are log2n elements in rest, so log2n-1 comparisons are needed to find the max therein.
    # This, coupled with the noted fact in second_largest_h that there are n-1 comparisons total
    # from calls to second_largest_h, means there are n-1 + log2n-1 = n+log2n-2 comparisons.
    rest.max
  end

  private

  def second_largest_h(arr)
    # Note that there are at most 1 comparisons in the base cases and 1 in the non-leaf nodes as well.
    # Therefore, the number of comparisons is at most the number of nodes in the recursive tree.
    # In an array of size 2^k, recognize that the base cases (leaf nodes) are all with arrays of
    # size 2. Therefore, the max depth of this tree is level log2n-1 (0-indexed). This means the
    # number of nodes is 2^(log2n-1+1) - 1 = 2^(log2n) - 1 = n - 1.
    n = arr.size

    raise StandardError.new('There should not be empty arrays given here') if n == 0

    # (At most) 1 comparison in base case.
    return [arr.first, []] if n == 1 # odd-lengthed array in caller
    if n == 2
      return arr.first > arr.second ? [arr.first, [arr.second]] : [arr.second, [arr.first]]
    end

    mid = n/2
    l = arr.first(mid)
    r = arr.last(n-mid)

    lmax, lrest = second_largest_h(l)
    rmax, rrest = second_largest_h(r)

    raise StandardError.new('elements should be unique') if lmax == rmax

    # 1 comparison in non-leaf nodes.
    return lmax > rmax ? [lmax, (lrest << rmax)] : [rmax, (rrest << lmax)]
  end
end
