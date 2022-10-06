# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  def change # rubocop:todo Metrics/MethodLength
    create_table :posts do |t|
      t.integer :authorId
      t.string :title
      t.string :text
      t.integer :commentsCounter
      t.references :user, null: false, foreign_key: true
      t.integer :likesCounter
      t.belongs_to :user
      t.has_many :comment
      t.has_many :like

      t.timestamps
    end
  end
end
