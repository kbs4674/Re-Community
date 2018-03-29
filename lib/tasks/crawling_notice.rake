namespace :crawling_notice do
  desc "TODO"
  task crawling_notice: :environment do
    #크롤링(nokogiri) : 강원대학교 공지사항
    doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do")) # 열고
    @posts = doc.css('#tab1_cont > ul > li') #article 클래스를 갖는 객체들을 전부 post에 담아
    @posts.each do |x| #각각 돌면서 Result에 추가해줍니다.
      tit = x.css('a').text
      camp = x.css('span.campus').text
      url = x.css('a').at("a[href]")
      url_swap = url['href']
      @res = CrawlingNotice.new(title: tit, campus: camp, url: url_swap)
      @res.save
    end
  end
end
