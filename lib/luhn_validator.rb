class LuhnValidator
  def initialize(account_number)
    @account_number = account_number
    @digits         = account_number.chars.map(&:to_i)
    @control_digit  = digits.pop
  end

  def valid?
    luhn_digit == control_digit
  end

  private

  attr_reader :account_number, :digits, :control_digit

  def luhn_digit
    control_digit.zero? ? sum % 10 == 0 : (10 - sum % 10)
  end

  def sum
    @operands ||= digits.reverse.flat_map.with_index do |digit, index|
      index.even? ? (digit * 2).divmod(10) : digit
    end

    @operands.reduce(:+)
  end
end

valid_number = LuhnValidator.new('79927398713')
invalid_number = LuhnValidator.new('79927398714')

puts valid_number.valid? # => true
puts invalid_number.valid? # => false


puts LuhnValidator.new('4111111111111111').valid?