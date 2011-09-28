class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.integer       :deed_id
      t.string        :name
      t.float         :amount, :null => false
      t.string        :purchase_type, :default => 'credit card'
      t.integer       :donor_id
      t.string        :address, :null => false
      t.string        :city, :null => false
      t.string        :state, :null => false
      t.string        :zipcode, :null => false
      t.string        :email, :null => false
      t.string        :ip_address
      t.string        :card_type
      t.date          :card_expires_on
      t.string        :status, :default => "pending"
      t.timestamps
    end
    add_index :purchases, :deed_id
    add_index :purchases, :donor_id
  end

  def self.down
    drop_table :purchases
  end
end
