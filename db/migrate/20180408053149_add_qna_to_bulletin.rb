class AddQnaToBulletin < ActiveRecord::Migration[5.1]
  def change
    add_column :bulletins, :qna, :boolean
  end
end
