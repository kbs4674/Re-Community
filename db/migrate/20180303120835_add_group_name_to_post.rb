class AddGroupNameToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :group_name, :string
  end
end
