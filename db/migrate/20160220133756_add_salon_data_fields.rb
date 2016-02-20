class AddSalonDataFields < ActiveRecord::Migration
  def change
    add_column :salons, :phone1, :string
    add_column :salons, :phone2, :string
    add_column :salons, :email, :string
    add_column :salons, :website, :string
    add_column :salons, :facebook, :string
    add_column :salons, :twitter, :string
    add_column :salons, :instagram, :string
  end
end
