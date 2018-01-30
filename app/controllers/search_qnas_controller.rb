class SearchQnasController < ApplicationController
    def index
        #검색엔진
        @search_qna = Qna.all.search do
          fulltext params[:search]
          paginate :page => params[:page], :per_page => 10
          order_by :created_at, :desc
        end
            
        @search_qna_results = @search_qna.results
    end
end
