class CharacterController < ApplicationController
    def index
        @characters= Character.all

    end
    
    def new
        @character = Character.new
        @character.chara_abis.build
    end
    
    def create
        
        @character.save
    end
    
    private
    def character_params
        params.require(:character).permit(:name,
                                     chara_abis_attributes: [:id, :valume, :character_id, :ability_id, :_destroy,
                                     abilitys_attributes:[:name]])
    end
end
