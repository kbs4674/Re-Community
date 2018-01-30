class AddImpressionsCountToQna < ActiveRecord::Migration[5.1]
  def change
    add_column :qnas, :impressions_count, :int
  end
end
