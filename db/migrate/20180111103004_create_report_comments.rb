class CreateReportComments < ActiveRecord::Migration[5.1]
  def change
    create_table :report_comments do |t|
      t.belongs_to :user
      t.belongs_to :comment
      
      t.timestamps
    end
  end
end
