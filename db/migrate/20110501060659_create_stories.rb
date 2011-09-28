class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.string :story_by
      t.boolean :is_published
      
      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
