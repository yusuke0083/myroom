class Character < ApplicationRecord
    has_many :chara_abis, dependent: :destroy
    has_many :abilitys, through: :characters_abilitys
    accepts_nested_attributes_for :chara_abis, allow_destroy: true, reject_if: :all_blank
end
