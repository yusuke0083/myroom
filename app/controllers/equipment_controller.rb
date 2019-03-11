class EquipmentController < ApplicationController
    
    def index
        @equipments= Equipment.all.order("level ASC")

    end
    
    def new
        @equipment = Equipment.new
        @equipment.equip_abis.build
        @equipment.equip_mates.build
    end
    
    def create
        Equipment.create(equipment_params)
        @equipment.save
    end
    
    private
    def equipment_params
        # 登録すると下の一文にエラーが発生する　内容【param is missing or the value is empty: equipment】
        params.require(:equipment).permit(:id, :name, :part, :level,
                                     equip_mates_attributes: [:id, :value, :equipment_id, :material_id, :_destroy,
                                     material_attributes:[:name]],
                                     equip_abis_attributes: [:id, :valume, :equipment_id, :ability_id, :_destroy,
                                     ability_attributes:[:name]])
    end
    
end
