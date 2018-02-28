class CreateCrawlingChuns < ActiveRecord::Migration[5.1]
  def change
    create_table :crawling_chuns do |t|
      t.string :title

      t.timestamps
    end
  end
end
