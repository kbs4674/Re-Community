class CreateCrawlingBacks < ActiveRecord::Migration[5.1]
  def change
    create_table :crawling_backs do |t|
      t.string :title

      t.timestamps
    end
  end
end
