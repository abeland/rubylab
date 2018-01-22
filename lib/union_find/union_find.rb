class UnionFind
  def initialize(n)
    @items = []
    @sizes = []
    n.times do |i|
      items << i # Set each item's parent to itself.
      sizes << 1 # N trees of size 1.
    end
  end

  def union(x, y)
    x_root = find(x)
    x_rank = sizes[x_root]

    y_root = find(y)
    y_rank = sizes[y_root]

    # Merge smaller tree into larger.
    if y_rank > x_rank
      items[x_root] = y_root
      sizes[y_root] += sizes[x_root]
    else # x_ranks >= y_rank
      items[y_root] = x_root
      sizes[x_root] += sizes[y_root]
    end
  end

  def find(x)
    curr = x
    while curr != items[curr]
      # Compress to be a child of the root, and
      # do that to all nodes in this branch.
      items[curr] = items[items[curr]]
      curr = items[curr]

      # Note: Alternate implementations go ahead and just
      # compress everything in this branch right away:
      #
      #   items[curr] = find(items[curr]) # done without a while loop
      #
      # However, this is dangerous is you create a really big UF instance.
      # It is foreseeable that one could potentially exceed the stack trace depth
      # limit and crash. Even with the less eager point-to-grandparent compression,
      # the worst case of M UF operations with N nodes on WQUPC is O(N + Mlg*N), so
      # it makes little difference really.
    end

    curr
  end


  def connected?(x, y)
    find(x) == find(y)
  end

  private

  attr_reader :items, :sizes
end
