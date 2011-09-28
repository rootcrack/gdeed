class CreateSpotlights < ActiveRecord::Migration
  def self.up
    create_table :spotlights do |t|
      t.integer     :deed_id
      t.timestamps
    end
    
    add_index :spotlights, :deed_id
    add_index :charities, :user_id
    add_index :profiles, :user_id
  end

  def self.down
    drop_table :spotlights
  end
end
