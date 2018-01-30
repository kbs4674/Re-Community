class CommentDestroysController < ApplicationController
    def comment_destroy_toggle
        comment_destroy=CommentDestroy.find_by(user_id: current_user.id,
                          comment_id: params[:comment_id])
                          
        if comment_destroy.nil?
            CommentDestroy.create(user_id: current_user.id,
                        comment_id: params[:comment_id])
                            
            else
                comment_destroy.destroy
        end
            
       redirect_to request.referrer
    end
end
