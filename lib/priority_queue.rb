class PriorityQueue
  # Use a heap to implement.
  def initialize(mode: :asc)
    @heap = mode == :desc ? MaxHeap.new : MinHeap.new
  end

  def enqueue(key, value)
    heap.add(key, value)

    true
  end

  def dequeue()
    _,v = heap.is_a?(MinHeap) ? heap.extract_min : heap.extract_max

    v
  end

  def empty?
    heap.size == 0
  end

  def size
    heap.size
  end

  private

  attr_reader :heap
end
