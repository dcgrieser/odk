class CreateEventImages < ActiveRecord::Migration
  def change
    create_table :event_images do |t|
      t.string :description
      t.integer :event_id
      t.string :image_uid
      t.string :image_name

      t.timestamps
    end
  end
end
