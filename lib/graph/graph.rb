module Graph
  class Base
    def initialize
      @adjacency_list = {}
    end

    def add_edge(u, v, c)
      adjacency_list[u] = [] unless adjacency_list.key?(u)
      adjacency_list[v] = [] unless adjacency_list.key?(v)
      adjacency_list[u] << [v, c]
    end

    def outgoing_edges(u)
      adjacency_list[u] || []
    end

    def nodes
      adjacency_list.keys
    end

    private

    attr_reader :adjacency_list
  end

  class Directed < Base; end

  class Undirected < Base
    def add_edge(u, v, c)
      super(u, v, c)
      super(v, u, c)
    end
  end
end
