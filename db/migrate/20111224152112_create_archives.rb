class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :title
      t.text   :description
      t.string :file_uid
      t.string :file_name

      t.timestamps
    end
  end
end
