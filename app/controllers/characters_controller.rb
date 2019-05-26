class CharactersController < ApplicationController
        
    def index
        @characters = Character.all
        @ability = Ability.group(:name).pluck(:name).sort
    end
    
    def search
        @abilitys = Ability.where('name LIKE ?', "%#{params[:name]}%")
        @ability = Ability.group(:name).pluck(:name).sort
        render :index
    end
    
    def new
        @character = Character.new
        @character.chara_abis.build
    end
    
    def create
        Character.create(character_params)
    end
    
    def destroy
        character = Character.find(params[:id])
        character.destroy
    end
    
    def edit
        @character = Character.find(params[:id])
    end
    
    def update
        character = Character.find(params[:id])
        character.update(character_params)
    end
    
    private
    def character_params
        params.require(:character).permit(:id, :name,
            chara_abis_attributes: [:id, :valume, :character_id, :ability_id, :_destroy, 
            abilitys_attributes:[:id, :name, :_destroy]])
    end
end
