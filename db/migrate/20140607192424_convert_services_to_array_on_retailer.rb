class ConvertServicesToArrayOnRetailer < ActiveRecord::Migration
  def change
    change_column :retailers, :services, :string, array: true
  end
end
