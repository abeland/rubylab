require 'prime'

module Problem10
  include Prime

  def problem10
    # Alternate is:
    # prime_geneartor.take_while{ |p| p < 2000000 }.sum
    # but that uses more memory. The below implementation
    # should use only O(1) memory and has the same running-time
    # asymptotic upper-bound, so I chose it.

    sum = 0
    prime_generator.each do |p|
      break if p >= 2000000
      sum += p
    end

    sum
  end
end
