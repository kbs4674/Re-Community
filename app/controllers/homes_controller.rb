class HomesController < ApplicationController
    def index
        @bulletins = Bulletin.all
        @posts_all = Post.order("created_at DESC").page(params[:page]).per(5)
        @notices_all = AllNotice.order("created_at DESC").page(params[:page]).per(5)
        @posts = Post.order("created_at DESC").page params[:page]
        @qnas = Qna.order("created_at DESC").page(params[:page]).per(5)
        
        @hot_posts = Post.all
        @hot_posts = Post.order("impressions_count DESC").page(params[:page]).per(5)
        
        @hot_post_likes = Post.order(:cached_votes_up => :desc).page(params[:page]).per(5)
        
        @hot_qnas = Qna.all
        @hot_qnas = Qna.order(:cached_votes_up => :desc).page(params[:page]).per(5)
        
        @qna_all = Qna.all
        @hot_qna_replys = CommentQna.order(:cached_votes_up => :desc).page(params[:page]).per(5)
    end
end
