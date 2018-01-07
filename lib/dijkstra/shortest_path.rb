module Dijkstra
  module ShortestPath
    def shortest_paths(graph, source)
      # Returns a map of a node to the shortest distance from s to that node.
      vv = Set.new(graph.nodes)

      # 1. Initialize X: the set of visited nodes, and Y = V-X
      xx = Set.new([])
      yy = vv - xx

      # 2. Add the outgoing edges from s to our min-heap.
      aa = ActiveSupport::HashWithIndifferentAccess.new

      h = Heap.new
      h.add(0, source)

      while xx.size != vv.size
        # Get the cheapest edge and destination node crossing the x/y boundary.
        dijkstra_metric, v = h.extract_min

        # The following would be possible if one did not use a delete-then-insert
        # approach with the heap and instead just kept adding new metrics for edges
        # as they were added to the boundary between X and Y. Note that in the latter
        # approach, however, the size of the heap is O(M) instead of O(N), where M = |E|
        # and N = |V|.
        #
        # next unless y.include?(v)

        aa[v] = dijkstra_metric

        # Move v from Y = V-X to X.
        xx.add(v)
        yy.delete(v)

        # Calculate the Dijkstra metric for each of the outgoing edges from v
        # and add to the heap, but only if the head node is in Y = V-X.
        graph.outgoing_edges(v).each do |e|
          w,c = e

          next unless yy.include?(w) # head node is in x

          # 1. Delete w from heap.
          k,_ = h.delete(w)

          # 2. Calculate new metric.
          dijkstra_metric = k.nil? ? aa[v] + c : [aa[v] + c, k].min

          # 3. Insert (potentially back) into heap.
          h.add(dijkstra_metric, w)
        end
      end

      aa
    end
  end
end
