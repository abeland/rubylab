module Problem2
  def problem2
    x = 0
    y = 1
    f = x + y
    sum = 0
    loop do
      f = x + y
      break if f > 4000000
      sum += f if f % 2 == 0
      x = y
      y = f
    end

    sum
  end
end
