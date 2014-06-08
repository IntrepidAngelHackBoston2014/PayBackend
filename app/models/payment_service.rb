class PaymentService < ActiveRecord::Base
  has_many :retailers

  SERVICE_CODES = %w("bpay cfrm coin dnkn leaf lvup ppal sbux").freeze

  def self.for_code(code)
    where("code = ?", code)
  end

  def self.bitcoin
    self.for_code('coin').first
  end

  def self.bitpay
    self.for_code('bpay').first
  end

  def self.cumberland_farms
    self.for_code('cfrm').first
  end

  def self.dunkin_donuts
    self.for_code('dnkn').first
  end

  def self.leaf
    self.for_code('leaf').first
  end

  def self.level_up
    self.for_code('lvup').first
  end

  def self.pay_pal
    self.for_code('ppal').first
  end

  def self.starbucks
    self.for_code('sbux').first
  end
end
