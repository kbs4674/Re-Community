class CreateCrawlingDormitoryMealBtls < ActiveRecord::Migration[5.1]
  def change
    create_table :crawling_dormitory_meal_btls do |t|
      t.string :title

      t.timestamps
    end
  end
end
