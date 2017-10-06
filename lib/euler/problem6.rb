module Problem6
  def problem6
    y = ((1..100).sum)**2
    (1..100).each{ |i| y -= i**2 }
    y
  end
end
