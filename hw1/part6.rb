class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id, *args)
    if args[0]
      singular_currency = args[0].to_s.gsub( /s$/, '')
      currency_val = 1 / @@currencies[singular_currency]
    else
      singular_currency = method_id.to_s.gsub( /s$/, '')
      currency_val = @@currencies[singular_currency]
    end
    if @@currencies.has_key?(singular_currency)
      self * currency_val
    else
      super
    end
  end
end

class String
  def palindrome?
    str = self.gsub /[\W+]/, ''
    reverse_str = str.reverse
    if reverse_str.downcase == str.downcase
      return true
    end
    return false
  end
end

module Enumerable
  def palindrome?
    return false if self.class == Hash
    self.to_a == self.to_a.reverse
  end
end