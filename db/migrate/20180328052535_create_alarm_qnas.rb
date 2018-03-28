class CreateAlarmQnas < ActiveRecord::Migration[5.1]
  def change
    create_table :alarm_qnas do |t|
      t.belongs_to :user
      t.belongs_to :qna
      t.timestamps
    end
  end
end
