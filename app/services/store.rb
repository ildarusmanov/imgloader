class Store
  def initialize(uploader)
    @uploader = uploader
  end

  def save_images(images_list)
    images_list.map do |image_file|
      store_file(image_file)
    end
  end

  private
 
  def store_file(image_file)
    {
      url: @uploader.store_file(image_file),
      source_url: image_file.source_url
    }
  end
end
