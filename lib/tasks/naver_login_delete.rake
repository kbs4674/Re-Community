namespace :naver_login_delete do
  desc "Delete records older than 1 weeks"
  task delete_naver_login_1weeks: :environment do
    Identity.where(['created_at <= ?', 1.weeks.ago]).each do |post|
      post.delete
    end
  end
end