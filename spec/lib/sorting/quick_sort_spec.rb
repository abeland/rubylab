require 'lib/sorting/shared_examples_for_sorting'

RSpec.describe QuickSort do
  include QuickSort

  def sorting_algo(arr)
    quick_sort(arr)
    arr
  end

  include_examples 'shared examples for sorting'
end
