class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.string :term_start_year
      t.integer :user_id

      t.timestamps
    end
  end
end
