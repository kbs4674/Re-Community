require 'rubygems'
require 'rest_client'
require 'cgi'

url = 'http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo?serviceKey=5gyn5FLcQFtbUEczDFKJjTIUWNw3%2FgNJRvCmb4uGDVT2kwrBO%2F7LSJoqM85znphfkenFzGf6e0WTU%2FeYsH%2FGKw%3D%3D'
headers = { :params => { CGI::escape('depPlaceId') => 'NAT140840', CGI::escape('arrPlaceId') => 'NAT010032', CGI::escape('depPlandTime') => "#{Time.now.strftime('%Y%m%d')}", CGI::escape('trainGradeCode') => '09' } }
response = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
puts response