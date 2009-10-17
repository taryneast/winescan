class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :address
      t.string :store_url
      t.string :affiliate_code
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
