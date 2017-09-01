# https://en.wikipedia.org/wiki/Luhn_algorithm
class LuhnValidator
  def initialize(account_number)
    @account_number = account_number
    @digits         = account_number.chars[0..-2].map(&:to_i)
    @control_digit  = account_number.chars.last.to_i
  end

  def valid?
    luhn_digit == control_digit
  end

  private

  attr_reader :account_number, :digits, :control_digit

  def luhn_digit
    control_digit.zero? ? sum % 10 : (10 - sum % 10)
  end

  def sum
    @operands ||= begin
      operands = digits.reverse.flat_map.with_index do |digit, index|
        index.even? ? (digit * 2).divmod(10) : digit
      end

      operands.reduce(:+)
    end
  end
end
