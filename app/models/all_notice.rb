class AllNotice < ApplicationRecord
    # 삭제되는 내용 기록
    acts_as_paranoid
    # 검색엔진 (Sunspot)
    searchable do
        text :title, :default_boost => 2 #제목
        text :content # 내용
        time :created_at
        text :user_name # 유저 닉네임
    end
    # 게시글 목록
    paginates_per 10
    # 조회수
    is_impressionable
    # 대댓글이 지원되는 댓글 Gem
    acts_as_commentable
    
    #has_many :impressions, :as=>:impressionable
    belongs_to :user
    has_many :qnas
    
    #def impression_count
    #    impressions.size
    #end
 
   #def unique_impression_count
       # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
       # so getting keys from the hash and calculating the number of keys
   #    impressions.group(:ip_address).size.keys.length #TESTED
   #end
end