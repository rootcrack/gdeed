class ChangeDeedSchedsFormat < ActiveRecord::Migration
  def self.up
    change_table :deeds do |t|
      t.change :starts_on, :datetime
      t.change :ends_on, :datetime
    end
  end

  def self.down
    change_table :deeds do |t|
      t.change :starts_on, :date
      t.change :ends_on, :date
    end
  end
end
