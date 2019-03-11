class CreateEquipAbis < ActiveRecord::Migration[5.2]
  def change
    create_table :equip_abis do |t|
      t.integer      :equipment_id
      t.integer      :ability_id
      t.integer      :valume
      t.timestamps null: true
    end
  end
end
