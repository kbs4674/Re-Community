namespace :crawling_meal do
  desc "TODO"
  task crawling_meal: :environment do
    #백록관 학식
    doc = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_02.asp"))
    @posts = doc.css('table > tbody')
    @posts.each do |x|
      #월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(2)').text.strip
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(3)').text.strip
        end
      end
      #화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(3)').text.strip
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(4)').text.strip
        end
      end
      #수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(4)').text.strip
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(5)').text.strip
        end
      end
      #목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(5)').text.strip
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(6)').text.strip
        end
      end
      #금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(6)').text.strip
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(7)').text.strip
        end
      end
      #토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(7)').text.strip
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(8)').text.strip
        end
      end
      #일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(8)').text.strip
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(9)').text.strip
        end
      end
      
      @res = CrawlingBack.new(title: back_meal)
      @res.save
    end
    
    #천지관 학식
    doc2 = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_01.asp"))
    @posts2 = doc2.css('table > tbody')
    @posts2.each do |x|
      #월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(3)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(2)').text.strip
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(2)').text.strip
        end
      end
      #화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(4)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(3)').text.strip
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(3)').text.strip
        end
      end
      #수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(5)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(4)').text.strip
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(4)').text.strip
        end
      end
      #목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(6)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(5)').text.strip
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(5)').text.strip
        end
      end
      #금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(7)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(6)').text.strip
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(6)').text.strip
        end
      end
      #토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(8)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(7)').text.strip
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(7)').text.strip
        end
      end
      
      @res2 = CrawlingChun.new(title: chun_meal)
      @res2.save
    end
    
    #재정 생활관 식단
    doc3 = Nokogiri::HTML(open("http://knudorm.kangwon.ac.kr/home/sub02/sub02_05_bj.jsp"))
    @posts3 = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01')
    @posts3.each do |x|
      #월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(3)').text.strip
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(4)').text.strip
        end
      end
      #화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(3)').text.strip
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(4)').text.strip
        end
      end
      #수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(3)').text.strip
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(4)').text.strip
        end
      end
      #목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(3)').text.strip
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(4)').text.strip
        end
      end
      #금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 8 && Time.zone.now.strftime("%H").to_i <= 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(3)').text.strip
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(4)').text.strip
        end
      end
      #토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)').text.strip
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)').text.strip
        end
      end
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)').text.strip
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)').text.strip
        end
      end
      
      @res3 = CrawlingDormitoryMealNormal.new(title: dormitory_meal_normal)
      @res3.save
    end
      
    #BTL 생활관 식단
    @posts4 = doc3.css('#foodtab2 > table.table_type01')
    @posts4.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > #foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > #foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(3)').text.strip
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > #foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(4)').text.strip
        end
      end
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(3)').text.strip
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(4)').text.strip
        end
      end
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(3)').text.strip
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(4)').text.strip
        end
      end
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(3)').text.strip
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(4)').text.strip
        end
      end
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(3)').text.strip
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(4)').text.strip
        end
      end
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)').text.strip
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)').text.strip
        end
      end
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i > 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)').text.strip
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)').text.strip
        end
      end
      
      @res4 = CrawlingDormitoryMealBtl.new(title: dormitory_meal_BTL)
      @res4.save
    end
  end
end
