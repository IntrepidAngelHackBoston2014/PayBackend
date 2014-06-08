class AddGeoIndexToRetailer < ActiveRecord::Migration
  def change
    add_index :retailers, [:latitude, :longitude]
  end
end
