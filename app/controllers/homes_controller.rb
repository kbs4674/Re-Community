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

        # *크롤링 목록들*
        #크롤링(nokogiri) : 열차 시간 조회(남춘천 출발)
        #일반 경춘선
        doc5 = Nokogiri::HTML(open("http://m.seoul.go.kr/traffic/SubInfoNearDetail.do?subSearch=G&station=P139&upage=2&flag=3&sflag=1"), nil, 'euc-kr')
        subway = doc5.css('div#subArrInfo > ul.lst > li:nth-child(1) > a > div')
        @subway_time = subway.map { |cur| cur.text }
        #급행 경춘선
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 9)
            doc6 = Nokogiri::HTML(open("http://k-subway.korail.com/station.do?op=timeTableDetail&stTrainNo=K8402&mainLine=G&inoutTag=1&weekTag=1&stationId=1328"), nil, 'utf-8')
            subway_rapid = doc6.css('body > div > table > tr:nth-child(3) > td:nth-child(2)')
        else
            doc6 = Nokogiri::HTML(open("http://k-subway.korail.com/station.do?op=timeTableDetail&stTrainNo=K8404&mainLine=G&inoutTag=1&weekTag=1&stationId=1328"), nil, 'utf-8')
            subway_rapid = doc6.css('body > div > table > tr:nth-child(3) > td:nth-child(2)')
        end
        @subway_rapid_time = subway_rapid.map { |cur| cur.text }
    end
end