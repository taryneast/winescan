class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :supplier_id
      t.integer :wine_id
      t.string :supplier_side_wine_id
      t.text    :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
