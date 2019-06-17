class EquipmentsController < ApplicationController
        
    def index
        @equipments = Equipment.all.order(:level)
        @part_hand = Equipment.where("part=?",'手').order(:level)
        @part_head = Equipment.where("part=?",'頭').order(:level)
        @part_body = Equipment.where("part=?",'体').order(:level)
        @part_foot = Equipment.where("part=?",'足').order(:level)
        @part_accessory = Equipment.where("part=?",'アクセ').order(:level)
    # 検索機能
        @abilitys = Ability.where("genre=? or genre=?",'装備','両用')
        @q = Equipment.ransack(params[:q])
        @equip_all = @q.result.includes(:abilitys).order(:level)
        @equip_hand = @q.result.includes(:abilitys).where("part=?",'手').order(:level)
        @equip_head = @q.result.includes(:abilitys).where("part=?",'頭').order(:level)
        @equip_body = @q.result.includes(:abilitys).where("part=?",'体').order(:level)
        @equip_foot = @q.result.includes(:abilitys).where("part=?",'足').order(:level)
        @equip_accessory = @q.result.includes(:abilitys).where("part=?",'アクセ').order(:level)
    end
    
    def search
        @equipments = Equipment.all
        @abilitys = Ability.where("genre=? or genre=?",'装備','両用')
        @q = Equipment.search(search_params)
        @equip_all = @q.result.includes(:abilitys)
        @equip_hand = @q.result.includes(:abilitys).where("part=?",'手')
        @equip_head = @q.result.includes(:abilitys).where("part=?",'頭')
        @equip_body = @q.result.includes(:abilitys).where("part=?",'体')
        @equip_foot = @q.result.includes(:abilitys).where("part=?",'足')
        @equip_accessory = @q.result.includes(:abilitys).where("part=?",'アクセ')
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
    
    def search_params
        params.require(:q).permit!
    end
    
end
