RSpec.describe PriorityQueue do
  context 'priority queue' do
    it 'sorting should work' do
      # Heapsort.
      sorted = (0..1000).to_a
      shuffled = sorted.shuffle

      expect(sorted).not_to eq(shuffled)

      pq = PriorityQueue.new
      shuffled.each { |x| pq.enqueue(x, x) }

      expect(pq.size).to eq(sorted.size)

      resulting_arr = []
      while !pq.empty?
        resulting_arr << pq.dequeue()
      end

      expect(sorted).to eq(resulting_arr)
    end
  end
end
