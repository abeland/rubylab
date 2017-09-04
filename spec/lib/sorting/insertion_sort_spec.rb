require 'lib/sorting/shared_examples_for_sorting'

RSpec.describe InsertionSort do
  include InsertionSort

  def sorting_algo(arr)
    insertion_sort(arr)
    arr
  end

  include_examples 'shared examples for sorting'
end
