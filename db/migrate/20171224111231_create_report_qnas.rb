class CreateReportQnas < ActiveRecord::Migration[5.1]
  def change
    create_table :report_qnas do |t|
      t.belongs_to :user
      t.belongs_to :qna

      t.timestamps
    end
  end
end
