class Ability < ApplicationRecord
    has_many :equip_abis, dependent: :destroy
    has_many :equipments, through: :equip_abis

    has_many :chara_abis, dependent: :destroy
    has_many :characters, through: :chara_abis

end
