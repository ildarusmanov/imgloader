class HomeController < ApplicationController
  TMP_PATH = "/tmp"

  def index
    link_form = LinkForm.new
    images = []
    link_form.url = link_form_params[:url] if link_form_params.has_key? :url

    if link_form.valid?
      images = image_processor.extract_images_from(link_form.url)
    end

    render :index, locals: { images: images, link_form: link_form }
  end

  private
  
  def link_form_params
    return {} unless params.has_key? :link_form

    return params[:link_form]
  end

  def image_processor
    ImageProcessor.new(page_parser, page_loader, file_downloader, store)
  end

  def page_parser
    PageParser.new
  end

  def page_loader
    PageLoader.new
  end

  def file_downloader
    FileDownloader.new(Pathname.new(TMP_PATH))
  end

  def store
    Store.new(image_uploader)
  end

  def image_uploader
    ImageUploader.new
  end
end

