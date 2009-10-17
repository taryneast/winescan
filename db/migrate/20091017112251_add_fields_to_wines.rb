class AddFieldsToWines < ActiveRecord::Migration
  def self.up
    rename_column :wines, :year, :vintage
    add_column :wines, :producer, :string
    add_column :wines, :country, :string
    add_column :wines, :appellation, :string
    add_column :wines, :style, :string # eg grape/country
    add_column :wines, :colour, :string
    add_column :wines, :sparkling, :boolean
    add_column :wines, :bottle_size, :string
    add_column :wines, :tasting_notes, :text
  end

  def self.down
    remove_column :wines, :producer
    remove_column :wines, :country
    remove_column :wines, :appellation
    remove_column :wines, :style
    remove_column :wines, :colour
    remove_column :wines, :sparkling
    remove_column :wines, :bottle_size
    remove_column :wines, :tasting_notes
  end
end
