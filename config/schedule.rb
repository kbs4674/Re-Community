require "tzinfo"

def local(time)
        TZInfo::Timezone.get('Asia/Seoul').local_to_utc(Time.parse(time))
end

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#

# [1달 단위] 1년 전 이미 삭제된 게시글 완전히 삭제
every 1.month, at: local('4:25 am') do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
    rake "posts:delete_all_post_1year"
end

# [1주일 단위] 네이버 로그인기록 삭제
every 7.days, at: local('4:30 am') do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
    rake "naver_login_delete:delete_naver_login_1weeks"
end

# [3일 단위] 자료 백업
every 3.days, at: local('4:50 am') do
#every 1.minutes do
    command "cd /home/ec2-user/knu;backup perform --trigger weekly_db_backup"
end

# [3일 단위] 백업된 자료 깃에 보내기
every 3.days, at: local('4:55 am') do
#every 2.minutes do
    command "cd /home/ec2-user/weekly_db_backup;git add .;git commit -m 'weekly_db_backup';git push -u db master"
end

# [매일] 식사 최신화
every :day, at: [local('0:01 am'), local('9:01 am'), local('14:01 pm')] do
    rake "crawling_meal:crawling_meal"
end

# [매일] 공지사항
every :day, at: local('5:10 am') do
    rake "crawling_notice:crawling_notice"
end

# [1주일] 크롤링 기록 제거
every 2.days, at: local('5:12 am') do
    rake "crawling_delete:crawling_delete"
end

# [매 한 달] 학사일정 가져오기 및 이전 달 크롤링 기록 제거
every 1.month, at: local('3:00 am') do
    rake "crawling_univ_schedule:crawling_univ_schedule"
end

# [매일] 버스 시간표 가져오기
every :monday, at: [local('0:00 am'), local('8:00 am'), local('8:20 am'), local('8:22 am'), local('8:40 am'), local('8:45 am'), local('8:50 am'), local('8:57 am'), local('9:10 am'), local('9:20 am'), local('9:45 am'), local('9:50 am'), local('9:51 am'), local('9:55 am'), local('10:20 am'), local('11:00 am'), local('4:00 pm'), local('4:30 pm'), local('5:00 pm'), local('5:20 pm'), local('5:40 pm'), local('6:00 pm'), local('6:20 pm'), local('6:40 pm'), local('7:00 pm')] do
    rake "crawling_bus:crawling_bus"
end

every :tuesday, at: [local('0:00 am'), local('8:00 am'), local('8:20 am'), local('8:22 am'), local('8:40 am'), local('8:45 am'), local('8:50 am'), local('8:57 am'), local('9:10 am'), local('9:20 am'), local('9:45 am'), local('9:50 am'), local('9:51 am'), local('9:55 am'), local('10:20 am'), local('11:00 am'), local('4:00 pm'), local('4:30 pm'), local('5:00 pm'), local('5:20 pm'), local('5:40 pm'), local('6:00 pm'), local('6:20 pm'), local('6:40 pm'), local('7:00 pm')] do
    rake "crawling_bus:crawling_bus"
end

every :wednesday, at: [local('0:00 am'), local('8:00 am'), local('8:20 am'), local('8:22 am'), local('8:40 am'), local('8:45 am'), local('8:50 am'), local('8:57 am'), local('9:10 am'), local('9:20 am'), local('9:45 am'), local('9:50 am'), local('9:51 am'), local('9:55 am'), local('10:20 am'), local('11:00 am'), local('4:00 pm'), local('4:30 pm'), local('5:00 pm'), local('5:20 pm'), local('5:40 pm'), local('6:00 pm'), local('6:20 pm'), local('6:40 pm'), local('7:00 pm')] do
    rake "crawling_bus:crawling_bus"
end

every :thursday, at: [local('0:00 am'), local('8:00 am'), local('8:20 am'), local('8:22 am'), local('8:40 am'), local('8:45 am'), local('8:50 am'), local('8:57 am'), local('9:10 am'), local('9:20 am'), local('9:45 am'), local('9:50 am'), local('9:51 am'), local('9:55 am'), local('10:20 am'), local('11:00 am'), local('4:00 pm'), local('4:30 pm'), local('5:00 pm'), local('5:20 pm'), local('5:40 pm'), local('6:00 pm'), local('6:20 pm'), local('6:40 pm'), local('7:00 pm')] do
    rake "crawling_bus:crawling_bus"
end

every :friday, at: [local('0:00 am'), local('8:00 am'), local('8:20 am'), local('8:22 am'), local('8:40 am'), local('8:45 am'), local('8:57 am'), local('9:10 am'), local('9:20 am'), local('9:39 am'), local('9:45 am'), local('9:55 am'), local('10:20 am'), local('11:00 am'), local('4:00 pm'), local('4:30 pm'), local('5:00 pm'), local('5:20 pm'), local('5:40 pm'), local('6:00 pm'), local('6:20 pm'), local('6:40 pm'), local('7:00 pm')] do
    rake "crawling_bus:crawling_bus"
end

# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever