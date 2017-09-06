RSpec.describe SecondLargest do
  include SecondLargest

  it 'should return nil when given an empty array' do
    expect(second_largest([])).to be nil
  end

  it 'should return nil when given a singleton' do
    expect(second_largest([1])).to be nil
  end

  it 'should work otherwise' do
    100.times do
      n = rand(1..1000)
      arr = (0..n-1).to_a.shuffle
      expect(second_largest(arr)).to eq(n-2)
    end
  end
end
