class AddPermalinkToSalon < ActiveRecord::Migration
  def change
    add_column :salons, :permalink, :string
    add_index :salons, :permalink, unique: true
  end
end
