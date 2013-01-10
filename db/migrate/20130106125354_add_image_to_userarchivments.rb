class AddImageToUserarchivments < ActiveRecord::Migration
  def change
    add_column :userarchivments, :image, :string
  end
end
