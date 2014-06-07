class AddPaymentServiceToRetailer < ActiveRecord::Migration
  def change
    add_reference :retailers, :payment_service, index: true
  end
end
