class Post < ApplicationRecord
    # 검색엔진 (Sunspot)
    searchable do
        text :title, :default_boost => 2 #제목
        text :content # 내용
        time :created_at
        integer :bulletin_id, :multiple => true
        text :user_name # 유저 닉네임
    end
    
    # AWS S3 업로드
    mount_uploader :image, ImageUploader
    # 투표 Gem 관련
    acts_as_votable
    # 게시글 및 댓글 제목, 내용을 다 썼는지 체크
    validates :title, :content, presence: true
    # 조회수 순 정렬
    is_impressionable :counter_cache => true, :unique => true
    # 게시판 목록 당 보여질 게시글 갯수
    #paginates_per 10
    # 삭제되는 내용 기록
    acts_as_paranoid
    # rolify + cancancan
    resourcify
    # 대댓글이 지원되는 댓글 Gem
    acts_as_commentable
    
    has_many :comments, dependent: :destroy
    belongs_to :bulletin
    belongs_to :user
    has_many :impressions, :as=>:impressionable
    has_many :reports, dependent: :destroy
    
    # 조회수(Impression) 설정
    def impression_count
        impressions.size
    end
    
    # 조회수(Impression) IP 기록 설정 
    def unique_impression_count
        # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
        # so getting keys from the hash and calculating the number of keys
        impressions.group(:ip_address).size.keys.length #TESTED
    end
end
