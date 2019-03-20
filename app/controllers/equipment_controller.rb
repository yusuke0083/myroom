class EquipmentController < ApplicationController
    
    def index
        @equipments= Equipment.all.order("level ASC")

    end
    
    def new
        @equipment = Equipment.new
        @equipment.equip_abis.build
        @equipment.equip_mates.build
        @equipment.save
    end
    
    def create
 
    end
    
    private
    def equipment_params
        # 登録すると下の一文にエラーが発生する　内容【param is missing or the value is empty: equipment】
        params.require(:equipment).permit(:id, :name, :part, :level,
            equip_mates_attributes: [:id, :value, :equipment_id, :material_id, :_destroy, materials_attributes: [:id, :name, :genre, :_destroy]], 
            equip_abis_attributes: [:id, :valume, :equipment_id, :ability_id, :_destroy, abilitys_attributes: [:id, :name, :_destroy]])
    end
    
end
