class CreateBulletins < ActiveRecord::Migration[5.1]
  def change
    create_table :bulletins do |t|
      t.string :title, comment: "제목"
      t.text :content, comment: "내용"
      t.integer :user_id
      t.string :user_name
      t.boolean :search_job, default: false # 구인 게시판 양식 설정 (사람 구함)
      t.boolean :seeking_job, default: false # 구직 게시판 양식 설정 (일자리 찾기)
      t.boolean :info_no_named, default: false # 익명 게시판 양식 설정
      t.boolean :info_room_trade, default: false # 방정보 게시판 양식 설정
      t.boolean :info_trade, default: false # 거래 게시판 양식 설정
      t.boolean :promote_store, default: false # 홍보 게시판 양식
      t.boolean :vote, default: false # 투표 게시판 양식
      t.boolean :seeking_room, default: false # 방 구해요 게시판 양식
      t.boolean :main_hidden, default: false # 홈페이지 메인에 안나타나게 하기
      t.boolean :member_boss, default: false # '사장' 권한 유저만 게시판 열람 허용
      t.boolean :member_univ, default: false # '대학관계자' 권한 유저만 게시판 열람 허용
      t.boolean :member_real_estate, default: false # '부동산 중개업자' 권한 유저만 게시판 열람 허용

      t.timestamps
    end
  end
end
