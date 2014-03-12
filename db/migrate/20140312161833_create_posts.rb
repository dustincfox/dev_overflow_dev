class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :body
      t.integer :votes
      t.boolean :open
      t.integer :favorite_answer

      t.timestamps
    end
  end
end
