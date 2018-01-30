class SearchesController < ApplicationController
    def index
        @search_post = Post.all.search do
            fulltext params[:search]
            paginate :page => params[:page], :per_page => 10
            without(:bulletin_id, [15, 16])
            order_by :created_at, :desc
        end
        
        @search_post_results = @search_post.results
    end
end
