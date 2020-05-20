class FavoritesController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        favorites=Favorite.all
        render json: favorites, include: ['project', 'user']
    end

    def show 
        favorite=Favorite.find(params[:id])
        render json: favorite, include: ['project', 'user']
    end


    def create
        favorite=Favorite.create(favorite_params)
        render json: favorite
    end

    def edit
        favorite=Favorite.find(params[:id])

        render json: favorite
    end

    def update
        favorite=Favorite.find(params[:id])
        favorite.update(favorite_params)
        render json: favorite
    end


    def destroy
        favorite=Favorite.find(params[:id])
        favorite.destroy
        render json: favorite
    end



    private


    def favorite_params
        params.require(:favorite).permit(:user_id, :project_id)
    end



end
