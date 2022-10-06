# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorId
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
