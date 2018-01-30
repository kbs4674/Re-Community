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
         :recoverable, :rememberable, :trackable, :validatable, :lockable
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
end
