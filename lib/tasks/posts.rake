namespace :posts do
  desc "Delete records older than 1 years"
  task delete_all_post_1year: :environment do
    Post.with_deleted.where(['deleted_at <= ?', 1.years.ago]).each do |post|
      post.really_destroy!
    end
    
    Qna.with_deleted.where(['deleted_at <= ?', 1.years.ago]).each do |post|
      post.really_destroy!
    end
  end
end