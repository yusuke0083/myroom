class EquipmentsController < ApplicationController
        
    def index
        @equipments = Equipment.all
        @ability = Ability.group(:name).pluck(:name).sort
        @part_hand = Equipment.where("part=?",'手')
    end
    
    def search
        @abilitys = Ability.where('name LIKE ?', "%#{params[:name]}%")
        @ability = Ability.group(:name).pluck(:name).sort
        render :index
    end
    
    def new
        @equipment = Equipment.new
        @equipment.equip_abis.build
        @equipment.equip_mates.build
    end
    
    def create
        Equipment.create(equipment_params)
    end
    
    def destroy
        equipment = Equipment.find(params[:id])
        equipment.destroy
    end
    
    def edit
        @equipment = Equipment.find(params[:id])
        @equipment.equip_abis.build
        @equipment.equip_mates.build
    end
    
    def update
        equipment = Equipment.find(params[:id])
        equipment.update(equipment_params)
    end
    
    private
    def equipment_params
        params.require(:equipment).permit(:id, :name, :part, :level,
            equip_mates_attributes: [:id, :value, :equipment_id, :material_id, :_destroy, materials_attributes: [:id, :name, :genre, :_destroy]],
            equip_abis_attributes: [:id, :valume, :equipment_id, :ability_id, :_destroy, abilitys_attributes: [:id, :name, :_destroy]])
    end
    
end
