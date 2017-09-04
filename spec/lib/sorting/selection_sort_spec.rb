require 'lib/sorting/shared_examples_for_sorting'

RSpec.describe SelectionSort do
  include SelectionSort

  def sorting_algo(arr)
    selection_sort(arr)
    arr
  end

  include_examples 'shared examples for sorting'
end
