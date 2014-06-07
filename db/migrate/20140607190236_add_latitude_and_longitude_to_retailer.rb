class AddLatitudeAndLongitudeToRetailer < ActiveRecord::Migration
  def change
    add_column :retailers, :latitude, :float
    add_column :retailers, :longitude, :float
  end
end
