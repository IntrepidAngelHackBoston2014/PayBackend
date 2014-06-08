require 'rails_helper'

RSpec.describe PaymentService, :type => :model do
  it { should have_many :retailers }
end
