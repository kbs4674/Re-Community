# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#

# [1년 단위] 이미 삭제된 게시글 완전히 삭제
every 1.month, :at => '4:30 am' do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
    rake "posts:delete_all_post_1year"
end

# [1주일 단위] 네이버 로그인기록 삭제
every 7.days, :at => '4:30 am' do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
    rake "naver_login_delete:delete_naver_login_1weeks"
end

# [3일 단위] 자료 백업
every 3.days, :at => '4:50 am' do
#every 1.minutes do
    command "cd /home/ec2-user/knu;backup perform --trigger weekly_db_backup"
end

# [3일 단위] 백업된 자료 깃에 보내기
every 3.days, :at => '4:55 am' do
#every 2.minutes do
    command "cd /home/ec2-user/weekly_db_backup;git add .;git commit -m 'weekly_db_backup';git push -u db master"
end

# [매일] 식사 최신화
every :day, at: ['11:59 pm', '09:01 am', '14:01 pm'] do
    rake "crawling_meal:crawling_meal"
end

# [매일] 공지사항
every :day, at: ['5:10 am'] do
    rake "crawling_notice:crawling_notice"
end

# [1주일] 크롤링 기록 제거
every 1.weeks, at: ['5:12 am'] do
    rake "crawling_delete:crawling_delete"
end

# [매 한 달] 학사일정 가져오기 및 이전 달 크롤링 기록 제거
every 1.month, at: ['3:00 am'] do
    rake "crawling_univ_schedule:crawling_univ_schedule"
end

# [매일] 버스 시간표 가져오기(등교)
every :day, at: ['0:00 am', '8:00 am', '8:20 am', '8:22 am', '8:40 am', '8:45 am', '8:50 am', '8:57 am', '9:10 am', '9:20 am', '9:39 am', '9:45 am', '9:50 am', '9:51 am', '9:55 am', '10:20 am', '11:00 am', '16:00 pm', '16:30 pm', '17:00 pm', '17:20 pm', '17:40 pm', '18:00 pm', '18:20 pm', '18:40 pm', '19:00 pm'] do
    rake "crawling_bus:crawling_bus"
end

# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever