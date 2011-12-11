class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.string :password_digest, :default => '!'
      t.date :initiation_date
      t.string :type
      t.boolean :active, :default => true, :null => false

      t.timestamps
    end
  end
end
