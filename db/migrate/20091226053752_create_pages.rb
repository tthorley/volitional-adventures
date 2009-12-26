class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :directing_question
      t.text :content
      t.integer :author_id
      t.integer :book_id
      t.integer :page_id
      t.boolean :published
      t.datetime :created_at
      t.datetime :modified_at

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
