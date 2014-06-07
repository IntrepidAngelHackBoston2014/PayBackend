class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :store_number
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.string :fax_number
      t.text :store_hours
      t.string :services, array: true, default: '{}'

      t.timestamps
    end
  end
end
