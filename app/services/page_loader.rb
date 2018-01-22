require "net/http"

class PageLoader
  DEFAULT_CONTENT = ""

  def load_page(url)
    begin
      Net::HTTP.get(URI(url)) 
    rescue
      DEFAULT_CONTENT
    end
  end
end
