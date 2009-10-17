class CreateWines < ActiveRecord::Migration
  def self.up
    create_table :wines do |t|
      t.string :name
      t.string :region
      t.integer :year
      t.string :variety
      t.string :wine_type
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :wines
  end
end
