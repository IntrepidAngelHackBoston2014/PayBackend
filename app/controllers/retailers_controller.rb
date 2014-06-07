class RetailersController < ApplicationController
  respond_to :json

  def index
    codes = params[:codes] || ['sbux']

    // #Leaf HQ
    lat = params[:lat] ||  42.366938
    lon = params[:lon] || -71.0778098

    distance = params[:distance] || 1

    center_point = [lat, lon]
    box = Geocoder::Calculations.bounding_box(center_point, distance)

    @retailers = Retailer.for_payment_service_codes(codes.split(',')).
                          within_bounding_box(box)

    respond_with(@retailers)
  end

end
