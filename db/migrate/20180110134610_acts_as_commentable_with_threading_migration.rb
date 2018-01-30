class ActsAsCommentableWithThreadingMigration < ActiveRecord::Migration[5.1]
  def self.up
    create_table :comments, :force => true do |t|
      t.string :nickname
      t.text :body
      t.string :remote_ip
      t.integer :commentable_id
      t.string :commentable_type
      t.string :title
      t.string :user_name
      t.integer :num
      t.string :subject
      t.integer :user_id, :null => false
      t.integer :parent_id, :lft, :rgt
      t.integer :bulletin # 게시판 카테고리 번호
      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, [:commentable_id, :commentable_type]
  end

  def self.down
    drop_table :comments
  end
end
