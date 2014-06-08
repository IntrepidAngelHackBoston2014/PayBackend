class RetailerSerializer < ActiveModel::Serializer
  attributes :id,
             :store_number,
             :name,
             :address,
             :display_address,
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

  def display_city
    if object.city.present? and object.state.present?
        "#{object.city},"
    elsif object.city.present?
      "#{object.city}"
    else
      ""
    end
  end

  def display_state
    if object.state.present?
        " #{object.state}"
    else
      ""
    end
  end

  def display_zip_code
    if object.zip_code.present?
        " #{object.zip_code}"
    else
      ""
    end
  end

  def display_address
    "#{object.address}\n#{display_city}#{display_state}#{display_zip_code}".strip
  end

end
