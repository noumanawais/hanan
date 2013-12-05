class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :body_text
      t.integer :status

      t.timestamps
    end
  end
end
