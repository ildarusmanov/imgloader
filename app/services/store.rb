class Store
  def initialize(uploader)
    @uploader = uploader
  end

  def save_images(images_list)
    images_list.map do |filepath|
      filelink = store_file(filepath)
      remove_tmp_file(filepath)

      filelink
    end
  end

  private
 
  def store_file(filepath)
    @uploader.store_file(filepath)
  end

  def remove_tmp_file(filepath)
    File.delete(filepath) if File.exist?(filepath)
  end
end
