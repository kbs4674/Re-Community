class AddPostIdToAlarmQnas < ActiveRecord::Migration[5.1]
  def change
    add_reference :alarm_qnas, :post, foreign_key: true
  end
end
