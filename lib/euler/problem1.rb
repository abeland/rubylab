module Problem1
  def problem1
    sum = 0
    (3..999).each do |i|
      sum += i if i % 3 == 0 || i % 5 == 0
    end
    sum
  end
end
