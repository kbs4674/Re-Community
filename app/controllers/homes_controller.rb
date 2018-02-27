require 'open-uri'

class HomesController < ApplicationController
    def index
        @bulletins = Bulletin.all
        @posts_all = Post.order("created_at DESC").page(params[:page]).per(5)
        @notices_all = AllNotice.order("created_at DESC").page(params[:page]).per(5)
        @posts = Post.order("created_at DESC").page params[:page]
        @qnas = Qna.order("created_at DESC").page(params[:page]).per(5)
        
        @hot_posts = Post.all
        @hot_posts = Post.order("impressions_count DESC").page(params[:page]).per(5)
        
        @hot_post_likes = Post.order(:cached_votes_up => :desc).page(params[:page]).per(5)
        
        @hot_qnas = Qna.all
        @hot_qnas = Qna.order(:cached_votes_up => :desc).page(params[:page]).per(5)
        
        @qna_all = Qna.all
        @hot_qna_replys = CommentQna.order(:cached_votes_up => :desc).page(params[:page]).per(5)
        
        #크롤링(nokogiri) : 강원대학교(춘천)캠퍼스 공지사항
        doc = Nokogiri::HTML(open("http://home.kangwon.ac.kr/main/html/main/main.jsp"))
        notice = doc.css('ul.list > li.noticeLi > a > strong')
        @kangwon_notice = notice.map { |cur| cur.text }
        notice_link = doc.css('ul.list > li.noticeLi > a').map { |link| link['href'] }
        @kangwon_notice_link = notice_link
        
        #크롤링(nokogiri) : 강원대학교(춘천)캠퍼스 공지사항
        doc = Nokogiri::HTML(open("http://home.kangwon.ac.kr/main/html/main/main.jsp"))
        notice = doc.css('ul.list > li.noticeLi > a > strong')
        @kangwon_notice = notice.map { |cur| cur.text }
        notice_link = doc.css('ul.list > li.noticeLi > a').map { |link| link['href'] }
        @kangwon_notice_link = notice_link
        
        #크롤링(nokogiri) : 강원대학교(춘천)캠퍼스 백록관(백반) 학식
        doc2 = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_02.asp"))
        #월요일 식단
        if Time.zone.now.strftime("%A") == "Monday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
                back_meal = doc2.css('table > tbody > tr:nth-child(5) > td:nth-child(2)')
            else
                back_meal = doc2.css('table > tbody > tr:nth-child(7) > td:nth-child(3)')
            end
        end
        #화요일 식단
        if Time.zone.now.strftime("%A") == "Tuesday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
                back_meal = doc2.css('table > tbody > tr:nth-child(5) > td:nth-child(3)')
            else
                back_meal = doc2.css('table > tbody > tr:nth-child(7) > td:nth-child(4)')
            end
        end
        #수요일 식단
        if Time.zone.now.strftime("%A") == "Wednesday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
                back_meal = doc2.css('table > tbody > tr:nth-child(5) > td:nth-child(4)')
            else
                back_meal = doc2.css('table > tbody > tr:nth-child(7) > td:nth-child(5)')
            end
        end
        #목요일 식단
        if Time.zone.now.strftime("%A") == "Thursday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
                back_meal = doc2.css('table > tbody > tr:nth-child(5) > td:nth-child(5)')
            else
                back_meal = doc2.css('table > tbody > tr:nth-child(7) > td:nth-child(6)')
            end
        end
        #금요일 식단
        if Time.zone.now.strftime("%A") == "Friday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
                back_meal = doc2.css('table > tbody > tr:nth-child(5) > td:nth-child(6)')
            else
                back_meal = doc2.css('table > tbody > tr:nth-child(7) > td:nth-child(7)')
            end
        end
        #토요일 식단
        if Time.zone.now.strftime("%A") == "Saturday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
                back_meal = doc2.css('table > tbody > tr:nth-child(5) > td:nth-child(7)')
            else
                back_meal = doc2.css('table > tbody > tr:nth-child(7) > td:nth-child(8)')
            end
        end
        #일요일 식단
        if Time.zone.now.strftime("%A") == "Sunday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
                back_meal = doc2.css('table > tbody > tr:nth-child(5) > td:nth-child(8)')
            else
                back_meal = doc2.css('table > tbody > tr:nth-child(7) > td:nth-child(9)')
            end
        end
        @back_meal = back_meal.map { |cur| cur.text }
        
        #크롤링(nokogiri) : 강원대학교(춘천)캠퍼스 천지관(백반) 학식
        doc3 = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_01.asp"))
        #월요일 식단
        if Time.zone.now.strftime("%A") == "Monday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(2) > td:nth-child(3)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(5) > td:nth-child(2)')
            else
                chun_meal = doc3.css('table > tbody > tr:nth-child(8) > td:nth-child(2)')
            end
        end
        #화요일 식단
        if Time.zone.now.strftime("%A") == "Tuesday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(2) > td:nth-child(4)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(5) > td:nth-child(3)')
            else
                chun_meal = doc3.css('table > tbody > tr:nth-child(8) > td:nth-child(3)')
            end
        end
        #수요일 식단
        if Time.zone.now.strftime("%A") == "Wednesday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(2) > td:nth-child(5)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(5) > td:nth-child(4)')
            else
                chun_meal = doc3.css('table > tbody > tr:nth-child(8) > td:nth-child(4)')
            end
        end
        #목요일 식단
        if Time.zone.now.strftime("%A") == "Thursday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(2) > td:nth-child(6)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(5) > td:nth-child(5)')
            else
                chun_meal = doc3.css('table > tbody > tr:nth-child(8) > td:nth-child(5)')
            end
        end
        #금요일 식단
        if Time.zone.now.strftime("%A") == "Friday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(2) > td:nth-child(7)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(5) > td:nth-child(6)')
            else
                chun_meal = doc3.css('table > tbody > tr:nth-child(8) > td:nth-child(6)')
            end
        end
        #토요일 식단
        if Time.zone.now.strftime("%A") == "Saturday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(2) > td:nth-child(8)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                chun_meal = doc3.css('table > tbody > tr:nth-child(5) > td:nth-child(7)')
            else
                chun_meal = doc3.css('table > tbody > tr:nth-child(8) > td:nth-child(7)')
            end
        end
        @chun_meal = chun_meal.map { |cur| cur.text }
        
        #크롤링(nokogiri) : 강원대학교(춘천)캠퍼스 재정생활관 학식
        doc4 = Nokogiri::HTML(open("http://knudorm.kangwon.ac.kr/home/sub02/sub02_05_bj.jsp"))
        ## 재정 생활관 식단 크롤링
        #월요일 식단
        if Time.zone.now.strftime("%A") == "Monday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(3)')
            else
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(4)')
            end
        end
        #화요일 식단
        if Time.zone.now.strftime("%A") == "Tuesday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(3)')
            else
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(4)')
            end
        end
        #수요일 식단
        if Time.zone.now.strftime("%A") == "Wednesday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(3)')
            else
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(4)')
            end
        end
        #목요일 식단
        if Time.zone.now.strftime("%A") == "Thursday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(3)')
            else
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(4)')
            end
        end
        #금요일 식단
        if Time.zone.now.strftime("%A") == "Friday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(3)')
            else
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(4)')
            end
        end
        #토요일 식단
        if Time.zone.now.strftime("%A") == "Saturday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)')
            else
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)')
            end
        end
        # 일요일 식단
        if Time.zone.now.strftime("%A") == "Sunday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)')
            else
                dormitory_meal_normal = doc4.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)')
            end
        end
        @dormitory_meal_normal = dormitory_meal_normal.map { |cur| cur.text }
        
        #크롤링(nokogiri) : 강원대학교(춘천)캠퍼스 BTL생활관 학식
        # 월요일 식단
        if Time.zone.now.strftime("%A") == "Monday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(3)')
            else
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(4)')
            end
        end
        # 화요일 식단
        if Time.zone.now.strftime("%A") == "Tuesday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(3)')
            else
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(4)')
            end
        end
        # 수요일 식단
        if Time.zone.now.strftime("%A") == "Wednesday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(3)')
            else
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(4)')
            end
        end
        # 목요일 식단
        if Time.zone.now.strftime("%A") == "Thursday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(3)')
            else
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(4)')
            end
        end
        # 금요일 식단
        if Time.zone.now.strftime("%A") == "Friday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(3)')
            else
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(4)')
            end
        end
        # 토요일 식단
        if Time.zone.now.strftime("%A") == "Saturday"
            if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)')
            else
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)')
            end
        end
        # 일요일 식단
        if Time.zone.now.strftime("%A") == "Sunday"
            if (Time.zone.now.strftime("%H").to_i > 0 && Time.zone.now.strftime("%H").to_i <= 9 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)')
            elsif (Time.zone.now.strftime("%H").to_i > 9 && Time.zone.now.strftime("%H").to_i <= 14 )
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)')
            else
                dormitory_meal_BTL = doc4.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)')
            end
        end
        @dormitory_meal_BTL = dormitory_meal_BTL.map { |cur| cur.text }
        
        #크롤링(nokogiri) : 열차 시간 조회(남춘천 출발)
        #일반 경춘선
        doc5 = Nokogiri::HTML(open("http://m.seoul.go.kr/traffic/SubInfoNearDetail.do?subSearch=G&station=P139&upage=2&flag=3&sflag=1"), nil, 'euc-kr')
        subway = doc5.css('div#subArrInfo > ul.lst > li:nth-child(1) > a > div')
        @subway_time = subway.map { |cur| cur.text }
        #급행 경춘선
        if (Time.zone.now.strftime("%H").to_i > 0 && Time.zone.now.strftime("%H").to_i <= 9)
            doc6 = Nokogiri::HTML(open("http://k-subway.korail.com/station.do?op=timeTableDetail&stTrainNo=K8402&mainLine=G&inoutTag=1&weekTag=1&stationId=1328"), nil, 'utf-8')
            subway_rapid = doc6.css('body > div > table > tr:nth-child(3) > td:nth-child(2)')
        else
            doc6 = Nokogiri::HTML(open("http://k-subway.korail.com/station.do?op=timeTableDetail&stTrainNo=K8404&mainLine=G&inoutTag=1&weekTag=1&stationId=1328"), nil, 'utf-8')
            subway_rapid = doc6.css('body > div > table > tr:nth-child(3) > td:nth-child(2)')
        end
        @subway_rapid_time = subway_rapid.map { |cur| cur.text }
        
        #ITX 청춘 (개발하다 그만둠.)
        doc7 = Nokogiri::HTML(open("https://map.naver.com/local/siteview.nhn?code=21598378&_ts=1519710537096#infoTab=timeTable&eStationID=3300324"), nil, 'utf-8')
        itx = doc7.css('div.article#_mainTabContents > div#_stationTimetable > div._timetableWrap > table.tbs5 > tr:nth-child(1)')
        @itx_time = itx.map { |cur| cur.text }
        
        #크롤링(nokogiri) : 강원대(춘천) 학사일정
        doc8 = Nokogiri::HTML(open("http://portal.kangwon.ac.kr/web/269807/1?p_p_id=58&p_p_action=1&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=3&_58_struts_action=%2Flogin%2Fview&_58_cmd=update"))
        schedule_time = doc8.css('table.taglib-search-iterator > tr > td:nth-child(1)')
        @kangwon_schedule = schedule_time.map { |cur| cur.text }
        schedule = doc8.css('table.taglib-search-iterator > tr > td:nth-child(2)')
        @schedule = schedule.map { |cur| cur.text }
        
        #크롤링 : 춘천시 날씨
        doc9 = Nokogiri::HTML(open("http://www.weather.go.kr/weather/observation/currentweather.jsp"))
        #도시 이름 (제대로 크롤링을 짚었는지 체크하기 위해)
        name = doc9.css('table.table_develop3 > tbody > tr:nth-child(17) > td:nth-child(1)')
        @chuncheon_name = name.map { |cur| cur.text }
        #날씨정보
        weather = doc9.css('table.table_develop3 > tbody > tr:nth-child(17) > td:nth-child(6)')
        @chuncheon_weather = weather.map { |cur| cur.text }
        #날씨 체크(업데이트)시간
        weather_check_time = doc9.css('.table_topinfo')
        @weather_check_time = weather_check_time.map { |cur| cur.text }
        #날씨 이미지
        doc10 = Nokogiri::HTML(open("https://www.accuweather.com/ko/kr/chuncheon/223554/weather-forecast/223554"), nil, 'utf-8')
        weather_icon = doc10.css('#feed-tabs > ul > li.night.current.first.cl > div.bg.bg-s.s > div.info > span')
        @weather_icon = weather_icon.map { |cur| cur.text }
        #미세먼지
        doc11 = Nokogiri::HTML(open("http://www.airkorea.or.kr/dustForecast/"))
        dust = doc11.css('#cont_body > div.graph_s2 > div:nth-child(8) > table > thead > tr:nth-child(3) > td:nth-child(6)')
        @chuncheon_dust = dust.map { |cur| cur.text }
    end
end
