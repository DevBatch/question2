require "pry"
class ValidCard
  
  def get_luhn_check_digit(account_number)
    number = account_number.scan(/./).collect{|n| n.to_i}
    doubly = number.each_slice(2).collect do |x, y|
      [x, y*2 > 9 ? (y*2)-9 : y*2]
    end
    sum = doubly.flatten.inject(:+)
    multi = sum * 9
    return account_number+ (multi % 10).to_s
  end
  
  def is_credit_card_valid?(card_number)
    integer_number = card_number.scan(/./).map(&:to_i)
    check = integer_number.pop

    sum = integer_number.reverse.each_slice(2).map do |x, y|
      [(x * 2).divmod(10), y || 0]
    end
    sum = sum.flatten.inject(:+)
    (10 - sum % 10) == check
  end
end
# card = ValidCard.new
#puts card.is_credit_card_valid?("79927398713") #=> true
#puts card.is_credit_card_valid?("79927398714") #=> false
#puts card.get_luhn_check_digit ("7992739871")#to get number with luhn check => 79927398713
