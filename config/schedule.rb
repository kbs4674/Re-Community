# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#

# [1년 단위] 이미 삭제된 게시글 완전히 삭제
every 30.day, :at => '4:30 am' do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
    rake "posts:delete_all_post_1year"
end
 
# [1주일 단위] 네이버 로그인기록 삭제
every 7.weeks, :at => '4:30 am' do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
    rake "naver_login_delete:delete_naver_login_1weeks"
end
 
# [1주일 단위] 자료 백업
every 7.weeks, :at => '4:50 am' do
    command "backup perform --trigger knu_backup"
end

# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
