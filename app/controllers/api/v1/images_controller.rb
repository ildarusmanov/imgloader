class Api::V1::ImagesController < ApplicationController
  respond_to :json

  expose :sourcelink, -> { Sourcelink.find_by_id params[:sourcelink_id] }
  expose :images, from: :sourcelink
  expose :image, -> { sourcelink.images.find_by_id params[:id] }

  def index
    respond_with images
  end

  def show
    respond_with image
  end
end
