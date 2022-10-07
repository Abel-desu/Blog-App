class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :authorId
      t.string :title
      t.string :text
      t.integer :commentsCounter
      t.references :user, null: false, foreign_key: true
      t.integer :likesCounter

      t.timestamps
    end
  end
end
