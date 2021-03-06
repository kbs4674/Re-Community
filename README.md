# README
Kangwon Univ. Community Prototype, Second Challenge
* Ruby version : Ruby 2.4.1, Rails 5.1.4
* Team : 김승한 / 이근식 / 서현석 / 김상열 / 김철민
* Git 자료실 : https://github.com/kbs4674/Re-Community
* AWS EC2 : <a href="http://13.125.169.156">http://13.125.169.156</a>

# 저작권 보호 / Copyright 문구
* "기밀유지" 프로젝트
* 해당 자료는 아직 Beta Test가 진행중인 프로젝트 자료입니다.
* kbs4674@naver.com, kbs4674@likelion.org, blog.naver.com/kbs4674, README.md 에 적힌 팀원 외에는 자료 무단 유출 사용을 불허합니다.

# 홈페이지 유의사항
1. 해당 프로젝트 파일에 있는 ZIP 압축파일 속에 있는 파일을 /config 디렉토리로 옮겨놓고 시작할 것.<br/>
    1) 암호는 운영진 카카오톡 공지 참고.<br/>
    2) 이 작업을 안하면 이 레일즈 프로젝트가 안돌아감.
2. 다음 명령어 실행할 것.<br/>
1)Sunspot<br/>
`rails g sunspot_rails:install`<br/>
`rake sunspot:solr:start`<br/>
`rake sunspot:reindex`<br/>
2)Whenever<br/>
`whenever --update-crontab`<br/>
`whenever`<br/>
3. [Furthermore : 서버셋팅 전용]<br/>
1)Postgre DB 업데이트<br/>
`sudo service postgresql95 restart`<br/>
2)Sunspot 최신화<br/>
`RAILS_ENV=production rails g sunspot_rails:install`<br/>
`RAILS_ENV=production rake sunspot:solr:start`<br/>
`RAILS_ENV=production rake sunspot:reindex`<br/>
3)scss 최신화<br/>
`rake assets:precompile RAILS_ENV=production`<br/>
4)자료백업 셋팅<br/>
<a href="https://blog.naver.com/kbs4674/221212397227" target="_blank">https://blog.naver.com/kbs4674/221212397227</a><br/>
`backup generate:model --trigger weekly_db_backup --databases="postgresql" --storages="s3" --compressor="gzip" --notifiers="mail"`<br/>
`backup check`<br/>
`backup perform --trigger weekly_db_backup`<br/>
5)whenever 셋팅<br/>
`whenever --update-crontab`<br/>
`whenever`<br/>
6)Redis-server 실행<br/>
`sudo service redis-server start`<br/>
7)서버 실행<br/>
`RAILS_ENV=production rails s -p 80 -b 0.0.0.0`
<br/><br/>


# 알아두면 좋은 지식
1. **[강추]** 알아두면 좋은 Gem : **[https://www.ruby-toolbox.com/](https://www.ruby-toolbox.com/)**
2. 알아두면 좋은 Gem 2 : **[http://cafe.naver.com/itctsixsens/23](http://cafe.naver.com/itctsixsens/23)**
3. 블로그 : **[http://blog.naver.com/kbs4674](http://blog.naver.com/kbs4674)**
4. Git Push/pull 시 잠시동안 암호를 묻지 않음.<br/>
`git config --global credential.helper 'cache --timeout 7200'`


# 버그 및 해결과제
1. 홈페이지 디자인... 그것이 문제로다