require 'lib/sorting/shared_examples_for_sorting'

RSpec.describe BubbleSort do
  include BubbleSort

  def sorting_algo(arr)
    bubble_sort(arr)
    arr
  end

  include_examples 'shared examples for sorting'
end
