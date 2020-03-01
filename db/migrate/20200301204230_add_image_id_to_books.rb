class AddImageIdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :image_id, :string
  end
end
