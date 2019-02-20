class CreateEquipMates < ActiveRecord::Migration[5.2]
  def change
    create_table :equip_mates do |t|

      t.timestamps
    end
  end
end
