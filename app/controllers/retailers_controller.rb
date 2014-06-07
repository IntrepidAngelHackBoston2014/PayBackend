class RetailersController < ApplicationController
  respond_to :json

  def index
    @retailers = Retailer.limit(3)
    respond_with(@retailers)
  end

end
