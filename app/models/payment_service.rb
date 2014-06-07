class PaymentService < ActiveRecord::Base
  has_many :retailers

  def self.for_code(code)
    where("code = ?", code)
  end

  def self.starbucks
    self.for_code('sbux').first
  end

  def self.dunkin_donuts
    self.for_code('dnkn').first
  end

  def self.cumberland_farms
    self.for_code('cfrm').first
  end
end
