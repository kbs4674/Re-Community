class Qna < ApplicationRecord
    # 검색엔진 (Sunspot)
    searchable do
        text :title, :default_boost => 2 #제목
        text :content # 내용
        time :created_at
        text :user_name # 유저 닉네임
    end
    # 투표 Gem 관련
    acts_as_votable
    # 조회수 순 정렬
    is_impressionable :counter_cache => true, :unique => true
    # 게시글 및 댓글 제목, 내용을 다 썼는지 체크
    validates :title, :content, presence: true
    # 게시판 목록 당 보여질 게시글 갯수
    paginates_per 5
    # 삭제되는 내용 기록
    acts_as_paranoid
    # rolify + cancancan
    resourcify
    # 대댓글이 지원되는 댓글 Gem
    acts_as_commentable
    
    belongs_to :user
    has_many :report_qnas, dependent: :destroy
    has_many :impressions, :as=>:impressionable
    has_many :comment_qnas, dependent: :destroy
 
   def impression_count
       impressions.size
   end
 
   def unique_impression_count
       # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
       # so getting keys from the hash and calculating the number of keys
       impressions.group(:ip_address).size.keys.length #TESTED
   end
end
