class Retailer < ActiveRecord::Base
  belongs_to :payment_service

  geocoded_by :full_street_address

  reverse_geocoded_by :latitude, :longitude

  after_validation :reverse_geocode, :if => :has_coordinates, :unless => :has_location
  after_validation :geocode, :if => :has_location, :unless => :has_coordinates

  def full_street_address
    [address, city, state, zip_code].compact.join(', ')
  end

  def has_location
    full_street_address.present?
  end

  def has_coordinates
    latitude.present? and longitude.present?
  end

  def self.for_payment_service_code(payment_service_code)
    joins(:payment_service).
    where("payment_services.code = ?", payment_service_code)
  end

  def self.for_payment_service_codes(payment_service_codes)
    joins(:payment_service).
    where("payment_services.code in (?)", payment_service_codes)
  end

end
