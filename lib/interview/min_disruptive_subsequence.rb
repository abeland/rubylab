module MinDisruptiveSubsequence
  def mdss(arr, subseq)
    n = arr.size
    k = subseq.size

    invariant(k <= n)

    min_subseq_idx = nil
    min_disruption = nil

    arr.each_with_index do |_, i|
      break if n - i < k
      puts "\nii: #{i}\n"

      disruption = 0
      subseq.each_with_index do |subseq_val, j|
        puts "i: #{i}, j: #{j}"
        arr_val = arr[i+j]
        disruption += (arr_val - subseq_val).abs
      end

      if min_disruption.nil? || disruption < min_disruption
        min_disruption = disruption
        min_subseq_idx = i
      end
    end

    [min_subseq_idx, min_disruption]
  end

  def mdss!(arr, subseq)
    min_subseq_idx, min_disruption = mdss(arr, subseq)

    (min_subseq_idx..(min_subseq_idx + subseq.size - 1)).each do |i|
      arr[i] = subseq[i - min_subseq_idx]
    end

    arr
  end
end
