class AddBarcodeToWine < ActiveRecord::Migration
  def self.up
    add_column :wines, :barcode, :string, :default => nil
  end

  def self.down
    remove_column :wines, :barcode
  end
end
