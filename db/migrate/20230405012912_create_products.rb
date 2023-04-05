class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :qty
      t.integer :qty_reserved
      t.text :image_link

      t.timestamps
    end
  end
end
