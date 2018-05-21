namespace :crawling_itx do
  desc "TODO"
  task crawling_itx: :environment do
        require 'rubygems'
        require 'rest_client'
        require 'cgi'
        
        CrawlingItx.each do |x|
            x.destroy
        end

        url = 'http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo?serviceKey=5gyn5FLcQFtbUEczDFKJjTIUWNw3%2FgNJRvCmb4uGDVT2kwrBO%2F7LSJoqM85znphfkenFzGf6e0WTU%2FeYsH%2FGKw%3D%3D'
        headers = { :params => { CGI::escape('numOfRows') => '30', CGI::escape('depPlaceId') => 'NAT140840', CGI::escape('arrPlaceId') => 'NAT010032', CGI::escape('depPlandTime') => "#{Time.now.strftime('%Y%m%d')}", CGI::escape('trainGradeCode') => '09' } }
        @itx_time_list = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
        @itx_time_to_xml = @itx_time_list.body
        @doc = Nokogiri::XML(@itx_time_to_xml)
        @itx_dep_time = @doc.xpath("//depplandtime")
        @itx_dep_time_to_hash = @itx_dep_time.map { |cur| cur.text }
        @itx_dep_time_to_hash.each do |x|
            @itx_dep_time_result = CrawlingItx.new
            if (Time.parse(x) >= Time.now+9.hours)
                @itx_dep_time_result.title = x
                @itx_dep_time_result.save
            end
        end
    end
end