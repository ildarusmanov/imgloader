require "acceptance_helper"

resource "Sourcelinks images" do
  let :sourcelink do
    create :sourcelink
  end

  let :image do
    sourcelink.images.first
  end

  get "/api/v1/sourcelinks/:sourcelink_id/images" do
    let(:sourcelink_id) { sourcelink.id }

    example_request "Sourcelink images listing" do
      parsed = JSON.parse(response_body)

      expect(status).to eq(200)
      expect(parsed["count"]).to eq(sourcelink.images.count)
      
      first_image = parsed["images"].first

      expect(first_image["id"]).to eq(image.id)
      expect(first_image["url"]).to eq(image.url)
      expect(first_image["source_url"]).to eq(image.source_url)
    end
  end

  get "/api/v1/sourcelinks/:sourcelink_id/images/:id" do
    let(:sourcelink_id) { image.sourcelink_id }
    let(:id) { image.id }

    example_request "Sourcelink image" do
      parsed = JSON.parse(response_body)
    
      expect(status).to eq(200)
      expect(parsed["id"]).to eq(image.id)
      expect(parsed["url"]).to eq(image.url)
      expect(parsed["source_url"]).to eq(image.source_url)
    end
  end
end

