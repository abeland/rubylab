module Problem4
  def problem4
    max_palindromic_num = nil
    (100..999).each do |i|
      (100..999).each do |j|
        product = i*j
        if (max_palindromic_num.nil? || product > max_palindromic_num) &&
           is_palindromic_num(product)
          max_palindromic_num = product
        end
      end
    end

    max_palindromic_num
  end

  private

  def is_palindrome(str)
    return true if str.size <= 1
    return false unless str[0] == str[str.size-1]
    is_palindrome(str[1..str.size-2])
  end

  def is_palindromic_num(x)
    is_palindrome(x.to_s)
  end
end
