class AddImageToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :image_uid
    end
  end
end
