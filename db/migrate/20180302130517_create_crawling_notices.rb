class CreateCrawlingNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :crawling_notices do |t|
      t.string :title
      t.string :url
      t.string :campus

      t.timestamps
    end
  end
end
