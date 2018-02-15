# README
Kangwon Univ. Community Prototype, Second Challenger
* Ruby version : Ruby 2.4.1, Rails 5.1.4
* Team : 김승한 / 이근식 / 서현석 / 김상열 / 김철민
* Git 자료실 : https://github.com/kbs4674/Re-Community
* AWS EC2 : <a href="http://52.78.125.110">http://52.78.125.110</a>

# 홈페이지 유의사항
1. 해당 프로젝트 파일에 있는 ZIP 압축파일 속에 있는 파일을 /config 디렉토리로 옮겨놓고 시작할 것.<br/>
    1) 암호는 운영진 카카오톡 공지 참고.<br/>
    2) 이 작업을 안하면 이 레일즈 프로젝트가 안돌아감.
2. 다음 명령어 실행할 것.<br/>
1)Sunspot<br/>
`rails g sunspot_rails:install`<br/>
`rake sunspot:solr:start`<br/>
`rake sunspot:reindex`<br/><br/>
2)Whenever<br/>
`whenever --update-crontab`<br/>
`whenever`<br/>
3. [Furthermore : 서버셋팅 전용]<br/>
1)Postgre DB 업데이트<br/>
`sudo service postgresql95 restart`
2)scss 최신화<br/>
`rake assets:precompile RAILS_ENV=production`


# 알아두면 좋은 지식
1. **[강추]** 알아두면 좋은 Gem : **[https://www.ruby-toolbox.com/](https://www.ruby-toolbox.com/)**
2. 알아두면 좋은 Gem 2 : **[http://cafe.naver.com/itctsixsens/23](http://cafe.naver.com/itctsixsens/23)**
3. 블로그 : **[http://blog.naver.com/kbs4674](http://blog.naver.com/kbs4674)**
4. Git Push/pull 시 잠시동안 암호를 묻지 않음.<br/>
`git config --global credential.helper 'cache --timeout 7200'`


# 버그 및 해결과제
1. 홈페이지 디자인... 그것이 문제로다
2. '질문답하기 게시판'의 게시글에 발도장(좋아요)을 누르고, 해당 발도장을 찍은 게시글에 댓글이 달릴 시 댓글알림이 뜨게 구현해야함.