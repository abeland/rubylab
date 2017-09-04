require 'lib/sorting/shared_examples_for_sorting'

RSpec.describe MergeSort do
  include MergeSort

  def sorting_algo(arr)
    merge_sort(arr)
  end

  include_examples 'shared examples for sorting'
end
