class PaymentService < ActiveRecord::Base
  has_many :retailers

  def self.for_code(code)
    where("code = ?", code)
  end

  def self.starbucks
    PaymentService.for_code('sbux').first
  end
end
