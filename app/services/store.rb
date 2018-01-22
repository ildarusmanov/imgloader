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
    @uploader.store_file(image_file)
  end
end
