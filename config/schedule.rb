# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#

 every 30.day, :at => '4:30 am' do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
    rake "posts:delete_all_post_1year"
 end
 
 every 1.minutes do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
    rake "naver_login_delete:delete_naver_login_1weeks"
 end

# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
