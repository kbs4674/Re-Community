class AddPostIdToCommentQnas < ActiveRecord::Migration[5.1]
  def change
    add_reference :comment_qnas, :post, foreign_key: true
  end
end
