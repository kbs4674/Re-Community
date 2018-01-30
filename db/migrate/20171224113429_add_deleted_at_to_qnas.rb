class AddDeletedAtToQnas < ActiveRecord::Migration[5.1]
  def change
    add_column :qnas, :deleted_at, :datetime
    add_index :qnas, :deleted_at
  end
end
