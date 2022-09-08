class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :user_id #foreign key to users table
      t.timestamps
    end
  end
end
