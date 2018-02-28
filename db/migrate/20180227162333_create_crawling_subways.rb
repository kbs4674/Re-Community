class CreateCrawlingSubways < ActiveRecord::Migration[5.1]
  def change
    create_table :crawling_subways do |t|
      t.string :title

      t.timestamps
    end
  end
end
