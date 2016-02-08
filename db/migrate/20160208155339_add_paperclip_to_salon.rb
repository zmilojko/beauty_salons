class AddPaperclipToSalon < ActiveRecord::Migration
  def change
    add_attachment :salons, :image  
  end
end
