# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null

class ArtworkSharesController < ApplicationController
  def create
    @artwork_share = ArtworkShare.new(share_params)
    
    if @artwork_share.save
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    
    @artwork_share = ArtworkShare.find_by(id: params[:id])
    redirect_to artwork_share_url(@artwork)
    @artwork_share.destroy
    
    
  end

  def index
    @artwork_shares = ArtworkShare.all
    render json: @artwork_shares
  end

  def show
    @artwork_share = ArtworkShare.find_by(id: params[:id])
    
    if @artwork_share
        render json: @artwork_shares
    else
        render plain: "no such artwork shared", status: 404
    end

  end

  private 
  def share_params
    params.require(:artwork_share).permit(:artwork_id,:viewer_id)
  end
end
