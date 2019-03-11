class CharacterController < ApplicationController
    def index
        @characters= Character.all

    end
    
    def new
        @character = Character.new
        @character.character_ability.build
    end
    
    def create
        Character.create(character_params)
        
        Ability.create(ability_params)
        
        @character.save
    end
    
    private
    def equipment_params
        params.require(:character).permit(:name,
                                     character_ability_attributes: [:id, :valume, :character_id, :ability_id, :_destroy,
                                     abilityl_attributes:[:name]])
    end
end
