class ChangeColumnNameOfTarget < ActiveRecord::Migration
  def self.up
    rename_column :deeds, :target, :target_amount
  end

  def self.down
    rename_column :deeds, :target_amount, :target
  end
end
