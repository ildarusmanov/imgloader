require "net/http"
require "securerandom"
require "uri"

class FileDownloader
  def initialize(tmp_path)
    @tmp_path = tmp_path
  end

  def download_files(links)
    links.map do |link|
      download_file(link)
    end
  end

  private

  def download_file(link)
    filepath = get_file_path(generate_filename(link))
    
    download_from_web_into(link, filepath)
  end

  def generate_filename(link)
    p = Pathname.new(URI(link).path)
    
    "#{SecureRandom.uuid}_#{p.extname}"
  end

  def get_file_path(filename)
    @tmp_path.join(filename).to_s
  end

  def download_from_web_into(link, filepath)
    uri = URI(link)

    image = ImageFile.new(filepath, "wb")

    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri
      http.request request do |response|
        response.read_body do |chunk|
          image.write chunk
        end
      end
    end

    image
  end
end
