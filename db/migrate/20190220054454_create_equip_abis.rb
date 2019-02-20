class CreateEquipAbis < ActiveRecord::Migration[5.2]
  def change
    create_table :equip_abis do |t|

      t.timestamps
    end
  end
end
