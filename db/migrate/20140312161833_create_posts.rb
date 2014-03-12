class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :body
      t.integer :votes, default: 0
      t.boolean :open, default: true
      t.integer :favorite_answer, default: nil
      t.belongs_to :user

      t.timestamps
    end
  end
end
