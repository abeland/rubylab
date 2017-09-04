RSpec.shared_examples 'shared examples for sorting' do |parameter|
  # You must define sorting algo. e.g. for the BubbleSort::bubble_sort test:
  #   ...
  #   include BubbleSort
  #   ...
  #   def sorting_algo(arr)
  #    bubble_sort(arr)
  #    arr # since bubble sort is in-place
  #  end

  it 'should handle an empty array' do
    expect(sorting_algo([])).to eq([])
  end

  it 'should handle a single-element array' do
    expect(sorting_algo([0])).to eq([0])
  end

  it 'should be able to sort integers' do
    100.times do
      n = rand(1..1000)
      arr = (0..n-1).to_a.shuffle
      expect(sorting_algo(arr)).to be_sorted
    end
  end
end
