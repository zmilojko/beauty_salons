class UniqueServicesSalons < ActiveRecord::Migration
  def change
    add_index :prices, [:salon_id, :service_id], :unique => true
  end
end
