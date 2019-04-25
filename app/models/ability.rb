class Ability < ApplicationRecord
    has_many :equip_abis, dependent: :destroy
    has_many :equipments, through: :abilitys_equipments

    has_many :chara_abis, dependent: :destroy
    has_many :characters, through: :abilitys_characters

end
