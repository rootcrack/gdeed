class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.integer       :user_id
      t.string        :name, :null => false
      t.string        :address
      t.string        :city, :null => false
      t.string        :state, :null => false
      t.string        :zipcode, :null => false
      t.string        :contact_name
      t.string        :contact_phone, :null => false
      t.string        :business_phone
      t.string        :logo
      t.boolean       :is_verified, :default => false
      t.timestamps
    end
    add_index :sponsors, :user_id
    add_index :sponsors, :zipcode
    add_index :sponsors, :state
    add_index :sponsors, :name
  end

  def self.down
    drop_table :sponsors
  end
end
