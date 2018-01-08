RSpec.describe Heap do
  context 'normal heap operations' do
    it 'should correctly keep track of size' do
      h = Heap.new
      expect(h.size).to eq 0

      (0..25).each do |i|
        h.add(i, i - 'a'.ord)
        expect(h.size).to eq(i + 1)
      end
    end

    it 'should correctly extract min' do
      h = Heap.new

      (1..1000).to_a.shuffle.each do |i|
        h.add(i, i)
      end

      expect(h.size).to eq(1000)

      (1..1000).each do |expected_idx|
        actual_idx, _ = h.extract_min
        expect(actual_idx).to eq(expected_idx)
        expect(h.size).to eq(1000 - expected_idx)
      end
    end

    it 'should correctly decrease_key' do
      h = Heap.new

      # Add everything with random keys.
      (1..1000).to_a.shuffle.each do |i|
        h.add(rand(1000) + i + 1, i)
      end

      # Now, decrease the key for everything to its actual value.
      (1..1000).to_a.shuffle.each do |i|
        h.decrease_key(i, i)
      end

      expect(h.size).to eq(1000)

      (1..1000).each do |i|
        k,v = h.extract_min
        expect(k).to eq(i)
        expect(v).to eq(i)
        expect(h.size).to eq(1000 - i)
      end
    end

    it 'should delete correctly' do
      h = Heap.new
      n = 1000

      # Add everything with index keys.
      (1..n).to_a.shuffle.each do |i|
        h.add(i, i)
      end

      expect(h.size).to eq(n)

      # Now, delete everything in reverse order, peeking to confirm.
      (1..n).each do |i|
        k,v = h.peek
        expect(k).to eq(i)
        expect(v).to eq(i)
        expect(h.delete(i)).to eq([i,i])
        expect(h.size).to eq(n - i)
      end
    end
  end
end
