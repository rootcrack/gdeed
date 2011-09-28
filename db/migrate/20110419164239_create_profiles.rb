class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer             :user_id
      t.date                :birth_date
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
