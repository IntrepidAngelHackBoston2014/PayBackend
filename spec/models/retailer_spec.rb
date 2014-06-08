require 'rails_helper'

RSpec.describe Retailer, :type => :model do
  it { should belong_to :payment_service }
end

RSpec.describe Retailer, :type => :model do
  it "determines if a location address is not present" do
    retailer = create :retailer, address: nil, city: nil, state: nil, zip_code: nil, latitude: nil, longitude: nil
    expect(retailer.has_location).to be_false
  end

  it "determines if a location address is present" do
    retailer = create :retailer
    expect(retailer.has_location).to be_true
  end
end
