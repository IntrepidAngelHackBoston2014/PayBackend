class RetailerSerializer < ActiveModel::Serializer
  attributes :id,
             :store_number,
             :name,
             :address,
             :city,
             :state,
             :zip_code,
             :phone_number,
             :fax_number,
             :store_hours,
             :services,
             :payment_service_code,
             :latitude,
             :longitude

  def payment_service_code
    object.payment_service.code
  end
end
