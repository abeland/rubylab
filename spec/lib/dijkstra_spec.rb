RSpec.describe Dijkstra do
  include Dijkstra::ShortestPath

  context 'shortest path' do
    it 'should be calculated correctly' do
      g = Graph::Directed.new
      g.add_edge('s', 'a', 1)
      g.add_edge('s', 'b', 4)
      g.add_edge('a', 'b', 2)
      g.add_edge('a', 't', 6)
      g.add_edge('b', 't', 3)
      a = shortest_paths(g, 's')
      expect(a['s']).to eq(0)
      expect(a['a']).to eq(1)
      expect(a['b']).to eq(3)
      expect(a['t']).to eq(6)

      g = Graph::Directed.new
      g.add_edge('s', 't', 1000)
      a = shortest_paths(g, 's')
      expect(a['s']).to eq(0)
      expect(a['t']).to eq(1000)

      g = Graph::Directed.new
      g.add_edge('s', 'a', 1)
      g.add_edge('a', 'b', 1)
      g.add_edge('b', 'c', 1)
      g.add_edge('c', 'd', 1)
      g.add_edge('d', 'e', 1)
      g.add_edge('e', 'f', 1)
      g.add_edge('f', 'g', 1)
      g.add_edge('g', 't', 1)
      a = shortest_paths(g, 's')
      expect(a['s']).to eq(0)
      expect(a['a']).to eq(1)
      expect(a['b']).to eq(2)
      expect(a['c']).to eq(3)
      expect(a['d']).to eq(4)
      expect(a['e']).to eq(5)
      expect(a['f']).to eq(6)
      expect(a['g']).to eq(7)
      expect(a['t']).to eq(8)

      g = Graph::Directed.new
      g.add_edge('s', 'a', 1)
      g.add_edge('a', 'b', 2)
      g.add_edge('b', 'c', 10)
      g.add_edge('c', 'd', 20)
      g.add_edge('d', 't', 30)
      g.add_edge('b', 'e', 11)
      g.add_edge('e', 'f', 12)
      g.add_edge('f', 'g', 13)
      g.add_edge('g', 't', 14)
      g.add_edge('s', 'f', 100)
      a = shortest_paths(g, 's')
    end

    it 'should work with repeated values' do
      g = Graph::Directed.new
      g.add_edge('s', 'a', 1)
      g.add_edge('a', 'b', 1)
      g.add_edge('b', 'c', 1)
      g.add_edge('c', 'd', 1)
      g.add_edge('d', 't', 1)
      g.add_edge('b', 'e', 2)
      g.add_edge('e', 'f', 2)
      g.add_edge('f', 'g', 2)
      g.add_edge('g', 't', 2)
      g.add_edge('s', 'f', 0)
      a = shortest_paths(g, 's')
      expect(a['s']).to eq(0)
      expect(a['a']).to eq(1)
      expect(a['b']).to eq(2)
      expect(a['c']).to eq(3)
      expect(a['d']).to eq(4)
      expect(a['e']).to eq(4)
      expect(a['f']).to eq(0)
      expect(a['g']).to eq(2)
      expect(a['t']).to eq(4)
    end
  end
end
