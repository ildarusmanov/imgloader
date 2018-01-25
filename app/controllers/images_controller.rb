class ImagesController < ApplicationController
  respond_to :json

  expose :images, from: :sourcelink
  expose :image, from: :sourcelink

  def index
    respond_with images
  end

  def show
    respond_with image
  end
end
