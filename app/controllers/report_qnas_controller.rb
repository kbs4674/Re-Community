class ReportQnasController < ApplicationController
     def report_qna_toggle
        report_qna=ReportQna.find_by(user_id: current_user.id,
                          qna_id: params[:qna_id])
                          
        if report_qna.nil?
            ReportQna.create(user_id: current_user.id,
                        qna_id: params[:qna_id])
                            
            else
                report_qna.destroy
        end
            
       redirect_to "/qnas/#{params[:qna_id]}"
    end
end