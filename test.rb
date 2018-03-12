require 'rubygems'
require 'rest_client'
require 'cgi'

url = 'http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo'
headers = { :params => { CGI::escape('ServiceKey') => '5gyn5FLcQFtbUEczDFKJjTIUWNw3/gNJRvCmb4uGDVT2kwrBO/7LSJoqM85znphfkenFzGf6e0WTU/eYsH/GKw==',CGI::escape('numOfRows') => '10' },CGI::escape('pageNo') => '1',CGI::escape('depPlaceId') => 'NAT010000',CGI::escape('arrPlaceId') => 'NAT011668',CGI::escape('depPlandTime') => '20180310',CGI::escape('trainGradeCode') => '00' }
response = RestClient::Request.execute :method => 'GET', :url => url, :headers => headers
puts response
