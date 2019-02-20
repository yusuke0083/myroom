class CreateCharaAbis < ActiveRecord::Migration[5.2]
  def change
    create_table :chara_abis do |t|

      t.timestamps
    end
  end
end
