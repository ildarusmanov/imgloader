require "acceptance_helper"

resource "Sourcelinks images" do
  let :sourcelink do
    Sourcelink.create(url: "http://t.com/test")
  end

  let :image_attrs do
    {
      url: "http://u.com/i123.png",
      source_url: "http://t.com/test/img.png"
    }
  end

  let :image do
    sourcelink.images.create(image_attrs)
  end

  get "/sourcelinks/:sourcelink_id/images" do
    let(:sourcelink_id) { sourcelink.id }

    example "Sourcelink images listing" do
      do_request

      expect(status).to eq(200)
      expect(response_body).to eq(sourcelink.images.to_json)
    end
  end

  get "/sourcelinks/:sourcelink_id/images/:id" do
    let(:sourcelink_id) { sourcelink.id }
    let(:id) { image.id }

    example "Sourcelink image" do
      do_request
    
      expect(status).to eq(200)
      expect(response_body).to eq(image.to_json)
    end
  end
end

