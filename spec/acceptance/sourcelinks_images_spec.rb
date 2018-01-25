require "acceptance_helper"

resource "Sourcelinks images" do
  let :sourcelink do
    Sourcelink.create(url: "http://t.com/test")
  end

  let :image_attrs do
    {
      source_url: "http://t.com/test/img.png",
      url: "http://u.com/i123.png",
    }
  end

  let :image do
    sourcelink.images.create(image_attrs)
  end

  get "/sourcelinks/:sourcelink_id/images" do
    let(:sourcelink_id) { sourcelink.id }

    example "Sourcelink images listing" do
      do_request

      status.should == 200
      expect(response_body).to eq(sourcelink.images.to_json)
    end
  end

  get "/sourcelinks/:sourcelink_id/:id" do
    let(:sourcelink_id) { sourcelink.id }
    let(:id) { image.id }

    example "Sourcelink image" do
      do_request
    
      status.should == 200
      expect(response_body).to eq(image.to_json)
    end
  end
end

