class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string      :name
      t.string      :part
      t.integer     :level
      t.timestamps null: true
    end
  end
end
