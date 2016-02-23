class AddCityToSalon < ActiveRecord::Migration
  def change
    add_column :salons, :city_name, :string
  end
end
