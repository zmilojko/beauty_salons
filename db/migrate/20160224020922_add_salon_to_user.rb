class AddSalonToUser < ActiveRecord::Migration
  def change
    add_column :users, :control, :integer
  end
end
