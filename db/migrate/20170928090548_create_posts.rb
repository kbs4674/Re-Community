class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      #공통
      t.string :title #게시판 제목
      t.text :content #게시판 내용
      t.integer :num #게시판 블라인드 Limit
      t.integer :user_id #게시글 작성자 정보(유저 번호)
      t.string :user_name #게시글 작성자 정보(유저 닉네임)
      t.boolean :notice, default: false #게시글 공지 지정 설정
      t.string :location #구인구직 영업점, 원룸 위치
      t.integer :phone_num #연락처
      t.string :etc #기타
      t.string :remote_ip #글 작성자 IP주소 추출
      t.string :image #이미지
      t.boolean :agree, default: false #동의서
      
      #1) 구인구직
      t.string :short_talk #한마디
      t.string :skill #요구 사항
      t.string :time #근무 날짜, 근무 시간
      t.integer :price_job #구인구직 인건비
      t.integer :person #희망하는 구인 인원수
      
      #2) 익명 게시판
      t.string :nickname #익명 게시판 가상 닉네임 설정
      
      #3) 방 정보
      t.string :room_select #월세/전세 선택
      t.integer :deposit #보증금
      t.string :scale #방 넓이(평수)
      t.integer :price_room #방 가격
      t.string :contract_day #장기/단기 선택
      
      #4) 거래게시판
      t.string :sns # SNS 계정
      t.string :vender #판매/구매 선택
      t.string :trade_way #선호거래 방법
      t.integer :price #거래 가격

      t.timestamps
    end
  end
end
