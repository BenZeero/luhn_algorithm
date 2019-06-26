module Luhn
  class << self
    def is_valid?(cardnumber)
      check_divisible_10(cardnumber).zero?
    end

    private
    def digits_of(n)
      n.to_s.chars.map(&:to_i)
    end

    def get_numbers(cardnumber)
      numbers = digits_of(cardnumber)
      numbers.reverse.map.with_index do |n, i|
        if i.odd?
          t = n*2
          t > 9 ? digits_of(t).inject(:+) : t
        else
          n
        end
      end
    end

    def sum_number(cardnumber)
      get_numbers(cardnumber).inject(:+)
    end
      
    def check_divisible_10(cardnumber)
      sum_number(cardnumber) % 10
    end
  end
end
