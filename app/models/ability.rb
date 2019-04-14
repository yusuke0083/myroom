class Ability < ApplicationRecord
    has_many :equip_abis, dependent: :destroy
    has_many :equipments, through: :abilitys_eequipments

    has_many :chara_abis, dependent: :destroy
    has_many :characters, through: :chara_abis

end
