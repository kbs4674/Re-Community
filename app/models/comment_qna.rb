class CommentQna < ApplicationRecord
  # AWS S3 업로드
  mount_uploader :image, ImageUploader
  # 게시판 목록 당 보여질 게시글 갯수
  paginates_per 10
  # 삭제되는 내용 기록
  acts_as_paranoid
  # 투표 Gem 관련
  acts_as_votable
  # rolify + cancancan
  resourcify
  
  belongs_to :qna
  belongs_to :user
end
