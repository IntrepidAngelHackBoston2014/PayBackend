class Retailer < ActiveRecord::Base
  belongs_to :payment_service
  reverse_geocoded_by :latitude, :longitude
end
