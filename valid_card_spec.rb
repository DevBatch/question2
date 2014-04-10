require "./valid_card"
require "rspec"
describe ValidCard do
  before do
    @validcard = ValidCard.new
  end
  it "this should return valid card not with luhn check" do
    @validcard.get_luhn_check_digit("7992739871").should == "79927398713"
  end
  it "This card no should be valid" do
    @validcard.is_credit_card_valid?("79927398713").should == true
  end
  it "should not a valid card no" do
    @validcard.is_credit_card_valid?("79927398714").should == false
  end
end

#puts ValidCard.is_credit_card_valid?("79927398713")
