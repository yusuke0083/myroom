class AddGenreToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :genre, :string
  end
end
