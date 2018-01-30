class CreateAllNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :all_notices do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.boolean :notice # 현재 게시판 공지
      t.boolean :all_notice # 전체 모든 게시판 공지
      t.boolean :comment_permission, default: true # 댓글 활성여부
      t.boolean :title_tag_permission, default: true # 제목 태그 활성여부
      t.string :user_name #게시글 작성자 정보(유저 닉네임)

      t.timestamps
    end
  end
end
