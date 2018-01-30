class ReportsController < ApplicationController
    def report_toggle
        report=Report.find_by(user_id: current_user.id,
                          post_id: params[:post_id])
                          
        if report.nil?
            Report.create(user_id: current_user.id,
                        post_id: params[:post_id])
                            
            else
                report.destroy
        end
       redirect_to "/bulletins/#{params[:bulletin_id]}/posts/#{params[:post_id]}"
    end
    
    def set_post
        @post = Post.find(params[:post_id])
    end
end