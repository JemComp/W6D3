class ArtworksController < ApplicationController
    
    def index
        @user = User.find_by(id: params[:user_id])
        @artworks = @user.artworks + @user.shared_artworks
       

        render json: @artworks
        
    end

    def show 
        @artwork = Artwork.find_by(id: params[:id])

        if @artwork
            render json: @artwork
        else
            render plain: 'No Such Artwork!', status: 404
        end
    end

    def create
        @artwork = Artwork.new(artwork_params)

        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update 
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render plain: "That action is not allowed", status: 404
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id])
        @artwork.destroy
        redirect_to artworks_url
    end



    private
    
    def artwork_params
       params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
