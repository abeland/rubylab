class MaxHeap
  # Idea is simple: we wrap a min-heap, and negate the keys as they go in, and as they come out.

  def initialize
    @min_heap = MinHeap.new
  end

  def to_s
    min_heap.to_s
  end

  def peek
    k,v = min_heap.peek
    [-k,v]
  end

  def extract_max
    k,v = min_heap.extract_min
    [-k,v]
  end

  def add(key, value)
    k,v = min_heap.add(-key, value)
    [-k,v]
  end

  def increase_key(v, new_key)
    k,v = min_heap.decrease_key(v, -new_key)
    [-k,v]
  end

  def delete(v)
    k,v = min_heap.delete(v)
    [-k,v]
  end

  def size
    min_heap.size
  end

  private

  attr_reader :min_heap
end
