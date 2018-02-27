class AddAdmonOnlyToBulletins < ActiveRecord::Migration[5.1]
  def change
    add_column :bulletins, :admin_only, :boolean
  end
end
