class ImageProcessor
  def initialize(parser, loader, downloader, store)
    @parser = parser
    @loader = loader
    @store = store
    @downloader = downloader
  end

  def extract_images_from(url)
    store_images download_images(parse_links(load_page(url), url))
  end

  private

  def load_page(url)
    @loader.load_page(url)
  end
  
  def load_files(links)
    @loader.load_files(links)
  end

  def parse_links(content, url)
    @parser.parse_links(content, url)
  end

  def download_images(links)
    @downloader.download_files(links)
  end

  def store_images(links)
    @store.save_images(links)
  end
end
