class ReportCommentsController < ApplicationController
    
    def report_comment_toggle
        report_comment = ReportComment.find_by(user_id: current_user.id,
                          comment_id: params[:comment_id])
                          
        if report_comment.nil?
            ReportComment.create(user_id: current_user.id,
                        comment_id: params[:comment_id])
                            
            else
                report_comment.destroy
        end
            
       redirect_to request.referrer
    end
    
end