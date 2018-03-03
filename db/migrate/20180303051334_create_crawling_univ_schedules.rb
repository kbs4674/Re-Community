class CreateCrawlingUnivSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :crawling_univ_schedules do |t|
      t.string :title
      t.string :time

      t.timestamps
    end
  end
end
