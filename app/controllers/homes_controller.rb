require 'open-uri'

class HomesController < ApplicationController
    #def crawling_subway_rapid
    #    #크롤링(nokogiri) : 열차 시간 조회(남춘천 출발)
    #    #일반 경춘선
    #    doc = Nokogiri::HTML(open("http://k-subway.korail.com/station.do?op=timeTableDetail&stTrainNo=K8404&mainLine=G&inoutTag=1&weekTag=1&stationId=1328"), nil, 'utf-8')
    #    @subway_rapid = doc.css('body > div > table')
    #    @subway_rapid.each do |x|
    #        subway_rapid = x.css('tr:nth-child(3) > td:nth-child(2)').text
    #        @result = CrawlingSubwayRapid.new(title: subway_rapid)
    #        @result.save
    #    redirect_to '/'
    #end
    
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
        
        #크롤링 목록들
        #크롤링(nokogiri) : 강원대학교(춘천)캠퍼스 공지사항
        #doc = Nokogiri::HTML(open("http://home.kangwon.ac.kr/main/html/main/main.jsp"))
        #notice = doc.css('ul.list > li.noticeLi > a > strong')
        #@kangwon_notice = notice.map { |cur| cur.text }
        #notice_link = doc.css('ul.list > li.noticeLi > a').map { |link| link['href'] }
        #@kangwon_notice_link = notice_link
        
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
    end
end
