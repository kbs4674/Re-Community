class AlarmQnasController < ApplicationController
    def alarm_qna_toggle
        alarm_qna=AlarmQna.find_by(user_id: current_user.id,
                          qna_id: params[:qna_id])
                          
        if alarm_qna.nil?
            AlarmQna.create(user_id: current_user.id,
                        qna_id: params[:qna_id])
                            
            else
                alarm_qna.destroy
        end
        
       redirect_to request.referrer
    end
end