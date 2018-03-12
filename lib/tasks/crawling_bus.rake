namespace :crawling_bus do
  desc "TODO"
  task crawling_bus: :environment do
    CrawlingBus.all.each do |post|
      post.delete
    end
    
    doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/contents.do?key=215&"))
    if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 11)
      @posts = doc.css("#contents > table:nth-child(11) > tbody")
      @posts.each do |x|
        # 월요일
        if (Time.zone.now.strftime("%A") == "Monday")
          if (Time.zone.now.strftime("%H").to_i == 00 && Time.zone.now.strftime("%M").to_i == 00)
            #08:00
            tit = x.css("tr:nth-child(1) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 00)
            #08:20
            tit = x.css("tr:nth-child(2) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 20)
            #08:22
            tit = x.css("tr:nth-child(3) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 22)
            #08:40
            tit = x.css("tr:nth-child(4) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 40)
            #08:45
            tit = x.css("tr:nth-child(5) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 45)
            #08:50
            tit = x.css("tr:nth-child(6) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 50)
            #08:57
            tit = x.css("tr:nth-child(7) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 57)
            #09:10
            tit = x.css("tr:nth-child(8) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 10)
            #09:20
            tit = x.css("tr:nth-child(9) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 20)
            #09:45
            tit = x.css("tr:nth-child(10) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 45)
            #09:50
            tit = x.css("tr:nth-child(11) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 50)
            #09:51
            tit = x.css("tr:nth-child(12) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 51)
            #09:55
            tit = x.css("tr:nth-child(13) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 55)
            #10:20		
            tit = x.css("tr:nth-child(14) > td:nth-child(2)").text
          elsif (Time.zone.now.strftime("%H").to_i == 10 && Time.zone.now.strftime("%M").to_i == 20)
            #10:23
            tit = x.css("tr:nth-child(15) > td:nth-child(2)").text
          end
        # 화~목
        elsif (Time.zone.now.strftime("%A") == "Tuesday" || Time.zone.now.strftime("%A") == "Wednesday" || Time.zone.now.strftime("%A") == "Thursday")
          if (Time.zone.now.strftime("%H").to_i == 00 && Time.zone.now.strftime("%M").to_i == 00)
            #08:00
            tit = x.css("tr:nth-child(1) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 00)
            #08:20
            tit = x.css("tr:nth-child(2) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 20)
            #08:22
            tit = x.css("tr:nth-child(3) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 22)
            #08:40
            tit = x.css("tr:nth-child(4) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 40)
            #08:45
            tit = x.css("tr:nth-child(5) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 45)
            #08:50
            tit = x.css("tr:nth-child(6) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 50)
            #08:57
            tit = x.css("tr:nth-child(7) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 57)
            #09:10
            tit = x.css("tr:nth-child(8) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 10)
            #09:20
            tit = x.css("tr:nth-child(9) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 20)
            #09:45
            tit = x.css("tr:nth-child(10) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 45)
            #09:50
            tit = x.css("tr:nth-child(11) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 50)
            #09:51
            tit = x.css("tr:nth-child(12) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 51)
            #09:55
            tit = x.css("tr:nth-child(13) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 55)
            #10:20
            tit = x.css("tr:nth-child(14) > td:nth-child(4)").text
          elsif (Time.zone.now.strftime("%H").to_i == 10 && Time.zone.now.strftime("%M").to_i == 20)
            #10:23
            tit = x.css("tr:nth-child(15) > td:nth-child(4)").text
          end
        #금요일
        elsif (Time.zone.now.strftime("%A") == "Friday")
          if (Time.zone.now.strftime("%H").to_i == 00 && Time.zone.now.strftime("%M").to_i == 00)
            #08:00
            tit = x.css("tr:nth-child(1) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 00)
            #08:20
            tit = x.css("tr:nth-child(2) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 20)
            #08:22
            tit = x.css("tr:nth-child(3) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 22)
            #08:40
            tit = x.css("tr:nth-child(4) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 40)
            #08:45
            tit = x.css("tr:nth-child(5) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 45)
            #08:57
            tit = x.css("tr:nth-child(6) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 8 && Time.zone.now.strftime("%M").to_i == 57)
            #09:10
            tit = x.css("tr:nth-child(7) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 10)
            #09:20
            tit = x.css("tr:nth-child(8) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 20)
            #09:39
            tit = x.css("tr:nth-child(9) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 39)
            #09:45
            tit = x.css("tr:nth-child(10) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 45)
            #09:55
            tit = x.css("tr:nth-child(11) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 9 && Time.zone.now.strftime("%M").to_i == 55)
            #10:20
            tit = x.css("tr:nth-child(12) > td:nth-child(6)").text
          elsif (Time.zone.now.strftime("%H").to_i == 10 && Time.zone.now.strftime("%M").to_i == 20)
            #10:30
            tit = x.css("tr:nth-child(13) > td:nth-child(6)").text
          end
        end
        @res = CrawlingBus.new(title: tit)
        @res.save
      end
    elsif (Time.zone.now.strftime("%H").to_i >= 11 && Time.zone.now.strftime("%H").to_i <= 19 ) # 하교
      @posts2 = doc.css("#contents > table:nth-child(15) > tbody")
      @posts2.each do |x|
      if (Time.zone.now.strftime("%H").to_i == 11 && Time.zone.now.strftime("%M").to_i == 00)
        #16:00
        tit = x.css("tr:nth-child(1) > td:nth-child(2)").text
      elsif (Time.zone.now.strftime("%H").to_i == 16 && Time.zone.now.strftime("%M").to_i == 00)
        #16:30
        tit = x.css("tr:nth-child(2) > td:nth-child(2)").text
      elsif (Time.zone.now.strftime("%H").to_i == 16 && Time.zone.now.strftime("%M").to_i == 30)
        #17:00
        tit = x.css("tr:nth-child(3) > td:nth-child(2)").text
      elsif (Time.zone.now.strftime("%H").to_i == 17 && Time.zone.now.strftime("%M").to_i == 00)
        #17:20
        tit = x.css("tr:nth-child(4) > td:nth-child(2)").text
      elsif (Time.zone.now.strftime("%H").to_i == 17 && Time.zone.now.strftime("%M").to_i == 20)
        #17:40
        tit = x.css("tr:nth-child(5) > td:nth-child(2)").text
      elsif (Time.zone.now.strftime("%H").to_i == 17 && Time.zone.now.strftime("%M").to_i == 40)
        #18:00
        tit = x.css("tr:nth-child(6) > td:nth-child(2)").text
      elsif (Time.zone.now.strftime("%H").to_i == 18 && Time.zone.now.strftime("%M").to_i == 00)
        #18:20
        tit = x.css("tr:nth-child(7) > td:nth-child(2)").text
      elsif (Time.zone.now.strftime("%H").to_i == 18 && Time.zone.now.strftime("%M").to_i == 20)
        #18:40
        tit = x.css("tr:nth-child(8) > td:nth-child(2)").text
      elsif (Time.zone.now.strftime("%H").to_i == 18 && Time.zone.now.strftime("%M").to_i == 40)
        #19:00
        tit = x.css("tr:nth-child(9) > td:nth-child(2)").text
      elsif (Time.zone.now.strftime("%H").to_i == 19 && Time.zone.now.strftime("%M").to_i == 00)
        #19:20
        tit = x.css("tr:nth-child(10) > td:nth-child(2)").text
      end
        @res2 = CrawlingBus.new(title: tit)
        @res2.save
      end
    end
  end
end