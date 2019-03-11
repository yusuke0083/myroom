class AddGenreToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :genre, :string
  end
end
