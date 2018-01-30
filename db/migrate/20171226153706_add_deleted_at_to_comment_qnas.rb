class AddDeletedAtToCommentQnas < ActiveRecord::Migration[5.1]
  def change
    add_column :comment_qnas, :deleted_at, :datetime
    add_index :comment_qnas, :deleted_at
  end
end
