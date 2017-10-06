require 'prime'

module Problem3
  include Prime

  def problem3
    prime_factors(600851475143).max
  end
end
