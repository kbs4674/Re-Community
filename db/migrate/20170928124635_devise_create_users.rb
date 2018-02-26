class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      # 닉네임 (http://itchipmunk.tistory.com/87)
      t.string :nickname,           null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      # SNS 연동로그인 애트리뷰트
      t.string :name
      
      # 댓글 자동 펼침 허용 여부
      t.boolean :comment_auto_open, default: true
      
      # 홈페이지 운영방침
      t.boolean :manage_agree, default: false

      # 한 마디
      t.string :do_say,           null: false, default: ""
      
      # 닉네임 아이콘
      t.string :profile_select, default: "profile_normal" #닉네임 이미지 선택
      t.string :profile_icon
      
      # 닉네임 배너 이미지
      t.string :profile_banner
      
      # 교통수단 설정
      t.string :transfer, default: "경춘선"
      
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
