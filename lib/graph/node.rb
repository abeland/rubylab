module Graph
  class Node
    attr_reader :key, :value

    def initialize(key:, value: nil)
      invariant(key.present?)
      @key = key
      @value = value
    end
  end
end
