class RenameTypeToWinetype < ActiveRecord::Migration
  def self.up
    rename_column :suppliers, :type, :supplier_type
  end

  def self.down
    rename_column :suppliers, :supplier_type, :type
  end
end
