RSpec.describe CountInversions do
  include CountInversions

  it 'should work on empty arrays' do
    expect(count_inversions([])).to eq(0)
  end

  it 'should work on singletons' do
    expect(count_inversions([0])).to eq(0)
  end

  it 'should work on large arrays with the same element' do
    expect(count_inversions([10,10,10,10,10,10,10,10,10,10])).to eq(0)
  end

  it 'should know a sorted array has no inversions' do
    100.times do
      n = rand(1..1000)
      arr = (0..n-1).to_a
      expect(count_inversions(arr)).to eq(0)
    end
  end

  it 'should know a reverse-sorted array has nC2 inversions' do
    100.times do
      n = rand(1..1000)
      arr = (0..n-1).to_a.reverse
      nc2 = (n*n - n) / 2
      expect(count_inversions(arr)).to eq(nc2)
    end
  end
end
