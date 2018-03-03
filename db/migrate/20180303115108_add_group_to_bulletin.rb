class AddGroupToBulletin < ActiveRecord::Migration[5.1]
  def change
    add_column :bulletins, :group, :boolean
  end
end
