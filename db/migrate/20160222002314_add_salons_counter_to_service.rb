class AddSalonsCounterToService < ActiveRecord::Migration
  def change
    add_column :services, :counter, :integer
  end
end
