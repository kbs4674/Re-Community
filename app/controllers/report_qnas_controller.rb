class ReportQnasController < ApplicationController
     def report_qna_toggle
        report_qna=ReportQna.find_by(user_id: current_user.id,
                          qna_id: params[:post_id])
                          
        if report_qna.nil?
            ReportQna.create(user_id: current_user.id,
                        qna_id: params[:post_id])
                            
            else
                report_qna.destroy
        end
            
       redirect_to request.referrer
    end
end