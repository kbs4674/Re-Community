class CreateCommentQnas < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_qnas do |t|
      t.references :qna, foreign_key: true
      t.text :body
      t.string :user_name
      t.integer :user_id

      t.timestamps
    end
  end
end
