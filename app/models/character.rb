class Character < ApplicationRecord
    has_many :chara_abis, dependent: :destroy
    has_many :abilitys, through:chara_abis
    accepts_nested_attributes_for :chara_abis, allow_destroy: true
end
