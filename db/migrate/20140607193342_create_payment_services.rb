class CreatePaymentServices < ActiveRecord::Migration
  def change
    create_table :payment_services do |t|
      t.string :name
      t.string :code
      t.string :app_id

      t.timestamps
    end
  end
end
