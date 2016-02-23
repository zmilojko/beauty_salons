class AddWorkHoursToSalon < ActiveRecord::Migration
  def change
    add_column :salons, :monday, :string
    add_column :salons, :thusday, :string
    add_column :salons, :wednesdey, :string
    add_column :salons, :thursday, :string
    add_column :salons, :friday, :string
    add_column :salons, :saturday, :string
    add_column :salons, :sunday, :string
  end
end
