namespace :crawling_univ_schedule do
  desc "TODO"
  task crawling_univ_schedule: :environment do
    CrawlingUnivSchedule.all.each do |post|
      post.delete
    end
    
    #크롤링(nokogiri) : 강원대학교 학사일정
    doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do"))
    @posts = doc.css("#container > section.layer.layer3 > div > section.schedule > ul > li > a")
    @posts.each do |x|
      tit = x.css("span.text")
      time = x.css("span.date")
      @res = CrawlingUnivSchedule.new(title: tit, time: time)
      @res.save
    end
  end
end
