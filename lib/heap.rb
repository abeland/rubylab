class Heap
  DEFAULT_SIZE = 16

  def initialize
    # A heap is efficiently stored in an array representation:
    # element i's left child is at index 2i+1, and the right child is at index 2i+2
    # (0-indexed).
    @arr = []
    DEFAULT_SIZE.times.each { |_| @arr << nil }
    @size = 0
    @v_to_i = {} # map of values to indices in @arr, for decrease_key
  end

  def to_s
    return '[]' if 0 == size

    q = [[0, arr.first]]

    strs = []
    num_in_next_level = 1
    while q.size > 0
      node_idx, node = q.shift

      strs << "#{node.first}: #{node.second}, "

      left_idx = node_idx * 2 + 1
      right_idx = node_idx * 2 + 2
      left = left_idx < arr.size ? arr[left_idx] : nil
      right = right_idx < arr.size ? arr[right_idx] : nil

      q << [left_idx, left] if left
      q << [right_idx, right] if right

      num_in_next_level -= 1
      if 0 == num_in_next_level
        strs << "\n"
        num_in_next_level = q.size
      end
    end

    strs.join('')
  end

  def peek
    arr.first
  end

  def extract_min
    invariant(size > 0, 'Heap is empty!')

    # We'll eventually return the root.
    old_root = arr.first

    # Find the last element, which should be at array size-1. Put this element at the root position, 0,
    # and then bubble it down.
    node = arr[size-1]

    # Order matters here: we first place the last node into the root position, then nil out the
    # last position. This matters in the case where there is exactly one node in the heap: we prefer
    # to have the array have nil elements everywhere, for clarity and ease of reasoning about correctness
    # and for debugging.
    arr[0] = node
    v_to_i[node.second] = 0
    arr[size-1] = nil
    v_to_i.delete(old_root.second)
    bubble_down(0)

    # We have removed the min, so update size to reflect this.
    @size -= 1

    old_root
  end

  def resize_if_necessary
    return unless size == arr.size

    # Arrays are mutable. Just double the size.
    arr.size.times.each { |_| @arr << nil }
  end

  def add(key, value)
    resize_if_necessary()

    node = [key, value]

    # Put this node at the lowest available index (size) and then bubble up.
    idx = size
    arr[idx] = node
    v_to_i[node.second] = idx
    node = bubble_up(idx)

    # We have added the node, so update size to reflect this.
    @size += 1

    node
  end

  def decrease_key(v, new_key)
    node_idx = v_to_i[v]
    invariant(node_idx.present?)

    node = arr[node_idx]
    curr_k, curr_v = node

    invariant(new_key <= curr_k)
    return if new_key == curr_k
    node[0] = new_key

    bubble_up(node_idx)
  end

  def delete(v)
    node_idx = v_to_i[v]
    return nil if node_idx.nil?

    # Swap with the last element.
    node = arr[node_idx]
    last_node = arr[size-1]
    arr[node_idx] = last_node
    arr[size-1] = nil
    v_to_i[last_node.second] = node_idx
    v_to_i.delete(node)

    bubble_down(node_idx)

    @size -= 1

    node
  end

  attr_reader :size

  private

  attr_reader :arr, :v_to_i

  def bubble_down(idx)
    node = arr[idx]

    while true
      left_idx = idx * 2 + 1
      right_idx = idx * 2 + 2
      left = left_idx < arr.size ? arr[left_idx] : nil
      right = right_idx < arr.size ? arr[right_idx] : nil

      if (left && (right.nil? || left.first < right.first)) && node.first > left.first
        arr[idx] = left
        arr[left_idx] = node
        v_to_i.merge!({ (left.second) => idx, (node.second) => left_idx })
        idx = left_idx
      elsif (right && (left.nil? || right.first < left.first)) && node.first > right.first
        arr[idx] = right
        arr[right_idx] = node
        v_to_i.merge!({ (right.second) => idx, (node.second) => right_idx })
        idx = right_idx
      else
        break
      end
    end

    idx
  end

  def bubble_up(idx)
    node = arr[idx]

    while idx > 0
      # Remember, a node's (at position it) left child is at position 2i+1, and
      # right child is at 2i+2. Therefore, a node's parent can be found by doing (i-1)/2.
      # E.g. for node at index 1, parent is located at index (1-1)/2 = 0, and a node at index 2
      # has its parent at index (2-1)/2 = 0 (integer division).
      parent_idx = (idx - 1) / 2
      parent = arr[parent_idx]
      node = arr[idx]

      # If the node's value is at least its parent's value, then the heap property is now
      # satisfied and so we can stop.
      break if node.first >= parent.first

      # Otherwise, we have to swap node and its parent.
      arr[parent_idx] = node
      arr[idx] = parent
      v_to_i.merge!({ (node.second) => parent_idx, (parent.second) => idx })

      idx = parent_idx
    end

    node
  end
end
