module Problem9
  def problem9
    (1..498).each do |a| # I'm sure there's a tigher bound but I don't really care.
      ((a+1)..499).each do |b| # a < b < c and a + b + c = 1000
        c = 1000 - a - b # a + b + c = 1000
        next if c <= b
        if a**2 + b**2 == c**2
          puts "a = #{a}, b = #{b}, c = #{c}"
          return a*b*c
        end
      end
    end

    nil
  end
end
