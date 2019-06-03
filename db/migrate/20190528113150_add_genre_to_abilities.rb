class AddGenreToAbilities < ActiveRecord::Migration[5.2]
  def change
    add_column :abilities, :genre, :string
  end
end
