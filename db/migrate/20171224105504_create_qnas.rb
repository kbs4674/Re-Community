class CreateQnas < ActiveRecord::Migration[5.1]
  def change
    create_table :qnas do |t|
      t.string :title
      t.text :content
      t.integer :num # 기본 블라인드 Limit 설정값
      t.integer :user_id
      t.string :user_name
      t.boolean :notice, default: false # 게시글 공지 지정 설정
      t.timestamps
    end
  end
end
