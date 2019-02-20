class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|

      t.timestamps
    end
  end
end
