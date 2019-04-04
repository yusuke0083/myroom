class EquipmentController < ApplicationController
    
    def index
        # @equipment = Equipment.find(params[:id])とするとエラーが生じる[Couldn'n find Equipment without an ID]
        @equipments = Equipment.all.order(level: "DESC")
        
        @materials = Material.where(params[:material_id])
        @values = Equipment.where(params[:value])
        
        @abilitys = Ability.where(params[:ability_id])
        @valumes = Equipment.where(params[:value]) 
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
        params.require(:equipment).permit(:id, :name, :part, :level,
            equip_mates_attributes: [:id, :value, :equipment_id, :material_id, :_destroy, materials_attributes: [:id, :name, :genre, :_destroy]], 
            equip_abis_attributes: [:id, :valume, :equipment_id, :ability_id, :_destroy, abilitys_attributes: [:id, :name, :_destroy]])
    end
    
end
