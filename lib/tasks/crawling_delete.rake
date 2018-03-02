namespace :crawling_delete do
  desc "TODO"
  task crawling_delete: :environment do
    CrawlingBack.where(['created_at <= ?', 1.weeks.ago]).each do |post|
      post.delete
    end
    
    CrawlingChun.where(['created_at <= ?', 1.weeks.ago]).each do |post|
      post.delete
    end
    
    CrawlingDormitoryMealNormal.where(['created_at <= ?', 1.weeks.ago]).each do |post|
      post.delete
    end
    
    CrawlingDormitoryMealBtl.where(['created_at <= ?', 1.weeks.ago]).each do |post|
      post.delete
    end
    
    CrawlingNotice.where(['created_at <= ?', 2.months.ago]).each do |post|
      post.delete
    end
  end
end
