class Material < ApplicationRecord
    has_many :equip_mates
    has_many :equipments, through: :materials_equipments
end
