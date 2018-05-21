class CreateCrawlingItxes < ActiveRecord::Migration[5.1]
  def change
    create_table :crawling_itxes do |t|
      t.string :title

      t.timestamps
    end
  end
end
