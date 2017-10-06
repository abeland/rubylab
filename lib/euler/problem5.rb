module Problem5
  def problem5
    i = 20
    loop do
      break if (1..20).all? {|j| i % j == 0}
      i += 20
    end

    i
  end
end
