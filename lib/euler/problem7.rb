require 'prime'

module Problem7
  include Prime

  def problem7
    # An alternative is simply:
    #   prime_generator.first(10001).last
    # but this is more memory efficient.
    i = 2
    j = 0
    loop do
      j += 1 if is_prime(i)
      return i if j == 10001
      i += 1
    end

    nil
  end
end
