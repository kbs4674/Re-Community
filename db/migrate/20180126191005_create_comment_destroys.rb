class CreateCommentDestroys < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_destroys do |t|
      t.belongs_to :user
      t.belongs_to :comment
      t.timestamps
    end
  end
end
