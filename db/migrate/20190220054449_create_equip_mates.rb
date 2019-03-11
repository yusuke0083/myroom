class CreateEquipMates < ActiveRecord::Migration[5.2]
  def change
    create_table :equip_mates do |t|
      t.integer      :equipment_id
      t.integer      :material_id
      t.integer      :value
      t.timestamps null: true
    end
  end
end
