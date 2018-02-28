class CreateCrawlingDormitoryNormals < ActiveRecord::Migration[5.1]
  def change
    create_table :crawling_dormitory_normals do |t|
      t.string :title

      t.timestamps
    end
  end
end
