class ImageFile < StringIO
  attr_accessor :filepath
  attr_accessor :source_url

  def initialize(*args)
    super(*args[2..-1])
    @filepath = args[0]
    @source_url = args[1]
  end

  def original_filename
    File.basename(@filepath)
  end
end
