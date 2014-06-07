class Retailer < ActiveRecord::Base
  belongs_to :payment_service
  reverse_geocoded_by :latitude, :longitude

  def self.for_payment_service_codes(payment_service_codes)
    joins(:payment_service).
    where("payment_services.code in (?)", payment_service_codes)
  end
end
