class User < ApplicationRecord
  # AWS S3 업로드
  mount_uploader :profile_icon, ImageUploader
  mount_uploader :profile_banner, ImageUploader
  # 권한 설정
  rolify
  # 투표 Gem 관련
  acts_as_voter
  # 알림 Gem 관련
  acts_as_reader
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :omniauthable
  # 닉네임 중복 검사
  validates_uniqueness_of :nickname
  # 유저 권한 기본 설정
  after_create :assign_default_role
  
  has_many :posts
  has_many :qnas
  has_many :bulletins
  has_many :comments
  has_many :comment_qnas
  has_many :reports
  has_many :report_qnas
  has_many :report_comments
  has_many :comment_destroys
  has_many :new_notifications
  has_many :all_notices
  
  #유저 권한 기본 설정
  def assign_default_role
    add_role(:student)
  end
  
  def is_report?(post)
    Report.find_by(user_id: self.id, post_id: post.id).present?
  end
  
  def is_report_qna?(qna)
    ReportQna.find_by(user_id: self.id, qna_id: qna.id).present?
  end

  def is_report_comment?(comment)
    ReportComment.find_by(user_id: self.id, comment_id: comment.id).present?
  end
  
  def is_comment_destroy?(comment)
    CommentDelete.find_by(user_id: self.id, comment_id: comment.id).present?
  end
  
  # 외부 로그인 연동
  has_many :identities, dependent: :destroy

  def self.find_for_oauth(auth, signed_in_resource = nil)
    # user와 identity가 nil이 아니라면 받는다
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    
    # user가 nil이라면 새로 만든다.
    if user.nil?
      # 이미 있는 이메일인지 확인한다.
      email = auth.info.email
      user = User.where(:email => email).first  
      unless self.where(email: auth.info.email).exists?
        # 없다면 새로운 데이터를 생성한다.
        if user.nil?
          user = User.new(
            name: auth.info.name,
            email: email ? auth.info.email : "#{auth.uid}@#{auth.provider}.com",
            nickname: "#{auth.uid}@#{auth.provider}",
            password: Devise.friendly_token[0,20]
          )            
          user.save!
        end
      end
    end
    
    if identity.user != user
      identity.user = user
      identity.uid = (0...8).map { (65 + rand(26)).chr }.join
      identity.save!
    end
    user
    
  end
  
  def email_required?
    false
  end
 
  def email_changed?
    false
  end
end
