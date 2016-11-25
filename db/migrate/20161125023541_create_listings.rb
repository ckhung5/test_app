class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :city
      t.string :country
      t.integer :bed_no

      t.timestamps null: false
    end
  end
end
