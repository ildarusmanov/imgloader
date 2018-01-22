class PageParser
  IMAGE_REGEX = "<img.*?src=\"([^\"]+)\""

  def parse_links(content, base_url)
    extract_image_links(content).map do |v|
      format_link(v.first, base_url)
    end
  end

  private

  def extract_image_links(content)
    r = Regexp.new(IMAGE_REGEX, Regexp::IGNORECASE | Regexp::MULTILINE)
    content.scan(r)
  end

  def format_link(link, base_url)
    if link[0,6] != "https:" && link[0,5] != "http:"
      return URI.join(base_url, link).to_s
    end
    
    return link
  end
end
