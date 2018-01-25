class SourcelinksController < ApplicationController
  expose :sourcelinks
  expose :sourcelink

  respond_to :json

  SOURCELINK_BUILDER = 'sourcelink_builder'

  def index
    respond_with sourcelinks
  end

  def show
    respond_with sourcelink
  end

  def create
    sourcelink = builder.create(sourcelink_params)

    respond_with sourcelink
  end

  private

  def builder
    get_di_container.get(SOURCELINK_BUILDER)
  end

  def sourcelink_params
    params.require(:sourcelink).permit(:url)
  end
end
