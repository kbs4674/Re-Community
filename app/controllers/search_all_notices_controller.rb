class SearchAllNoticesController < ApplicationController
    def index
        @search_all_notice = AllNotice.all.search do
            fulltext params[:search]
            paginate :page => params[:page], :per_page => 10
            order_by :created_at, :desc
        end
        
        @all_notice_results = @search_all_notice.results
    end
end
