# https://en.wikipedia.org/wiki/Luhn_algorithm
class LuhnValidator
  def initialize(account_number)
    @account_number_array = account_number.chars
    @processable_digits   = @account_number_array[0..-2].map(&:to_i)
    @control_digit        = @account_number_array.last.to_i
  end

  def valid?
    luhn_digit == control_digit
  end

  private

  attr_reader :processable_digits, :control_digit

  def luhn_digit
    control_digit.zero? ? sum % 10 : (10 - sum % 10)
  end

  def sum
    @sum ||= operands.reduce(:+)
  end

  def operands
    processable_digits.reverse.map.with_index do |digit, position|
      position.even? ? (digit * 2).divmod(10).reduce(:+) : digit
    end
  end
end
