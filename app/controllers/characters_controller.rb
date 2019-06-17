class CharactersController < ApplicationController
        
    def index
        @characters = Character.all.order(:genre)
        @genre_nomal = Character.where("genre=?",'初期').order(:genre)
        @genre_mh = Character.where("genre=?",'モンハン').order(:genre)
        @genre_battle = Character.where("genre=?",'戦争').order(:genre)
        @genre_mate = Character.where("genre=?",'素材集め').order(:genre)
        # 検索機能
        @q = Character.ransack(params[:q])
        @abilitys = Ability.where("genre=? or genre=?",'キャラ','両用')
        @chara = @q.result.includes(:abilitys).order(:genre)
        @chara_nomal = @q.result.includes(:abilitys).where("characters.genre=?",'初期').order(:genre)
        @chara_mh = @q.result.includes(:abilitys).where("characters.genre=?",'モンハン').order(:genre)
        @chara_battle = @q.result.includes(:abilitys).where("characters.genre=?",'戦争').order(:genre)
        @chara_mate = @q.result.includes(:abilitys).where("characters.genre=?",'素材集め').order(:genre)
    end
    
    def search
        @characters = Character.all
        @abilitys = Ability.where("genre=? or genre=?",'キャラ','両用')
        @q = Character.search(search_params)
        @chara = @q.result.includes(:abilitys)
        @chara_nomal = @q.result.includes(:abilitys).where("characters.genre=?",'初期')
        @chara_mh = @q.result.includes(:abilitys).where("characters.genre=?",'モンハン')
        @chara_battle = @q.result.includes(:abilitys).where("characters.genre=?",'戦争')
        @chara_mate = @q.result.includes(:abilitys).where("characters.genre=?",'素材集め')
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
        params.require(:character).permit(:id, :name, :genre,
            chara_abis_attributes: [:id, :valume, :character_id, :ability_id, :_destroy, 
            abilitys_attributes:[:id, :name, :genre, :_destroy]])
    end
    
    def search_params
        params.require(:q).permit!
    end
end
