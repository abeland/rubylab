RSpec.describe MaxHeap do
  context 'normal heap operations' do
    it 'should correctly keep track of size' do
      h = MaxHeap.new
      expect(h.size).to eq 0
      (0..25).each do |i|
        h.add(i, i + 'a'.ord)
        expect(h.size).to eq(i+1)
      end
    end

    it 'should correctly extract max' do
      h = MaxHeap.new
      (1..1000).to_a.shuffle.each do |i|
        h.add(i, i)
      end

      expect(h.size).to eq 1000
      1000.downto(1).each do |expected_idx|
        actual_idx, _ = h.extract_max
        expect(actual_idx).to eq(expected_idx)
        expect(h.size).to eq(expected_idx - 1)
      end
    end

    it 'should correctedly increase_key' do
      h = MaxHeap.new

      # Add random keys for each index.
      (1..1000).to_a.shuffle.each do |i|
        h.add(i - rand(1000) - 1, i)
      end

      # Now, increase the key for everything to the index.
      (1..1000).to_a.shuffle.each do |i|
        h.increase_key(i, i)
      end

      expect(h.size).to eq 1000

      1000.downto(1).each do |i|
        k,v = h.extract_max
        expect(k).to eq(i)
        expect(v).to eq(i)
        expect(h.size).to eq(i-1)
      end
    end

    it 'should delete correctly' do
      h = MaxHeap.new
      n = 1000

      # Add everything with index keys.
      (1..n).to_a.shuffle.each do |i|
        h.add(i, i)
      end

      expect(h.size).to eq(n)

      # Now, delete everything in reverse order, peeking to confirm.
      n.downto(1).each do |i|
        k,v = h.peek
        expect(k).to eq i
        expect(v).to eq i
        expect(h.delete(i)).to eq([i,i])
        expect(h.size).to eq(i-1)
      end
    end
  end
end
