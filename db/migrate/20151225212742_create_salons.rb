class CreateSalons < ActiveRecord::Migration
  def change
    create_table :salons do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
