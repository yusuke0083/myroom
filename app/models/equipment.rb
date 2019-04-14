class Equipment < ApplicationRecord
    has_many :equip_abis, dependent: :destroy
    accepts_nested_attributes_for :equip_abis, allow_destroy: true
    has_many :abilitys, through: :equipments_abilitys
    
    has_many :equip_mates, dependent: :destroy
    accepts_nested_attributes_for :equip_mates, allow_destroy: true
    has_many :materials, through: :equipmets_materials
   
end
