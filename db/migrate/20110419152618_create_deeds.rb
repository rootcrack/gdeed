class CreateDeeds < ActiveRecord::Migration
  def self.up
    create_table :deeds do |t|
      t.integer     :charity_id
      t.integer     :sponsor_id
      t.float       :amount
      t.float       :price
      t.integer     :target
      t.date        :starts_on
      t.date        :ends_on
      t.string      :status, :default => "pending"
      t.timestamps
    end
    add_index :deeds, :charity_id
    add_index :deeds, :sponsor_id
  end

  def self.down
    drop_table :deeds
  end
end
