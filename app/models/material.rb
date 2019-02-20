class Material < ApplicationRecord
    has_many :equip_mates
    has_many :equipments, through: :equip_mates
end
