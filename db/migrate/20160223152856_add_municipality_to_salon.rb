class AddMunicipalityToSalon < ActiveRecord::Migration
  def change
    add_column :salons, :municipality_name, :string
  end
end
