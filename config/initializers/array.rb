class Array
  def sorted?
    prev = nil

    each do |item|
      return false unless prev.nil? || item >= prev
      prev = item
    end

    true
  end
end
