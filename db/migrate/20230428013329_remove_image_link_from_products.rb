class RemoveImageLinkFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :image_link, :string
  end
end
