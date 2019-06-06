class EquipmentsController < ApplicationController
        
    def index
        @equipments = Equipment.all
        @part_hand = Equipment.where("part=?",'手') 
        @part_head = Equipment.where("part=?",'頭')
        @part_body = Equipment.where("part=?",'体')
        @part_foot = Equipment.where("part=?",'足')
        @part_accessory = Equipment.where("part=?",'アクセ')
    # 検索機能
        @abilitys = Ability.all
        @q = Equipment.ransack(params[:q])
        @equip_hand = @q.result.includes(:equipment, :abilitys).where("part=?",'手').to_sql
        @equip_head = @q.result.includes(:equipment, :abilitys).where("part=?",'頭').to_sql
        @equip_body = @q.result.includes(:equipment, :abilitys).where("part=?",'体').to_sql
        @equip_foot = @q.result.includes(:equipment, :abilitys).where("part=?",'足').to_sql
        @equip_accessory = @q.result.includes(:equipment, :abilitys).where("part=?",'アクセ').to_sql
    end
    
    def search
        @equipments = Equipment.all
        @abilitys = Ability.all
        @q = Equipment.search(search_params)
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
    params.require(:q).permit(:ability_name_cont_all)
    end
    
end
