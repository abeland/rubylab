module Prime
  def first_n_primes(n)
    prime_generator.take(n)
  end

  def prime_generator
    Enumerator.new do |ret|
      x = 1
      loop do
        while !is_prime(x) do
          x += 1
        end

        ret << x
        x += 1
      end
    end
  end

  def is_prime(x)
    # Forget negatives, and 0 and 1 are not prime.
    return false if x <= 1

    # 2 is special as it is the only even which is prime.
    return true if x == 2

    # All evens are composites.
    return false if x % 2 == 0

    # Only need to check up to sqrt(x).
    !((3..(Math.sqrt(x).ceil)).any? {|i| x % i == 0 })
  end

  def prime_factors(x)
    raise 'Come on' if x < 1
    return [] if x == 1
    return [x] if is_prime(x)

    # Find the first prime which is a factor,
    # then recursively find the others.
    first_prime_factor = (2..(Math.sqrt(x).ceil)).find do |i|
      x % i == 0 && is_prime(i)
    end

    ([first_prime_factor] + prime_factors(x/first_prime_factor)).uniq
  end
end
