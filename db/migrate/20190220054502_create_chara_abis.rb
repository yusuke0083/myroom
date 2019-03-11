class CreateCharaAbis < ActiveRecord::Migration[5.2]
  def change
    create_table :chara_abis do |t|
      t.integer      :character_id
      t.integer      :ability_id
      t.integer      :valume
      t.timestamps null: true
    end
  end
end
