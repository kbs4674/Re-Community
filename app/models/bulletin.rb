class Bulletin < ApplicationRecord
    # AWS S3 업로드
    mount_uploader :image, ImageUploader
    # 삭제되는 내용 기록
    acts_as_paranoid
    # 게시판 목록 당 보여질 게시글 갯수
    paginates_per 5
    
    has_many :posts, dependent: :destroy
    belongs_to :user
end
