# https://en.wikipedia.org/wiki/Luhn_algorithm
class LuhnValidator
  def initialize(account_number)
    @account_number = account_number.chars.map(&:to_i)
  end

  def valid?
    luhn_digit == check_digit
  end

  private

  attr_reader :account_number

  def account_digits
    account_number[0..-2]
  end

  def check_digit
    account_number[-1]
  end

  def luhn_digit
    check_digit.zero? ? sum % 10 : (10 - sum % 10)
  end

  def sum
    @sum ||= operands.reduce(:+)
  end

  def operands
    account_digits.reverse.map.with_index do |digit, position|
      position.even? ? (digit * 2).divmod(10).reduce(:+) : digit
    end
  end
end
