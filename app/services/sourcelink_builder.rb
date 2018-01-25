class SourcelinkBuilder
  def initialize(image_processor)
    @image_processor = image_processor
    @errors = []
  end

  def create(params)
    sourcelink = create_sourcelink(params)

    return sourcelink if has_errors?

    images = extract_images(sourcelink.url)
    save_images sourcelink, images
  end

  def has_errors?
    @errors.length > 0
  end

  private

  def create_sourcelink(params)
    sourcelink = Sourcelink.create(params)
    unless sourcelink.persisted?
      add_error "Can not create new sourcelink"
    end
    sourcelink
  end

  def extract_images(url)
    @image_processor.extract_images_from url
  end

  def save_images(sourcelink, images)
    images.each do |image|
      sourcelink.images.create image
    end

    sourcelink
  end

  def add_error(error)
    @errors.push error
  end
end

