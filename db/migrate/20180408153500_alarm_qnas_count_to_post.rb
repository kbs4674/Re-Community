class AlarmQnasCountToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :alarm_qnas_count, :int
  end
end
