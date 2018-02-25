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
        
        #크롤링(nokogiri) : 강원대학교(춘천)캠퍼스 재정생활관 학식
        doc2 = Nokogiri::HTML(open("http://knudorm.kangwon.ac.kr/home/sub02/sub02_05_bj.jsp"))
        #토요일 식단
        if Time.now.strftime("%A") == "Saturday"
            if (Time.now.strftime("%H").to_i >= 0 && Time.now.strftime("%H").to_i <= 9 )
                dormitory_meal_normal = doc2.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)')
            elsif (Time.now.strftime("%H").to_i >= 10 && Time.now.strftime("%H").to_i <= 14 )
                dormitory_meal_normal = doc2.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)')
            else
                dormitory_meal_normal = doc2.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)')
            end
        end
        # 일요일 식단
        if Time.now.strftime("%A") == "Sunday"
            if (Time.now.strftime("%H").to_i >= 0 && Time.now.strftime("%H").to_i <= 9 )
                dormitory_meal_normal = doc2.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)')
            elsif (Time.now.strftime("%H").to_i >= 10 && Time.now.strftime("%H").to_i <= 14 )
                dormitory_meal_normal = doc2.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)')
            else
                dormitory_meal_normal = doc2.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)')
            end
        end
        @dormitory_meal_normal = dormitory_meal_normal.map { |cur| cur.text }
    end
end
