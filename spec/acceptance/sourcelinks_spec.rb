require "acceptance_helper"

resource "Sourcelinks" do
  get "/sourcelinks" do
    before do
      5.times do |i|
        Sourcelink.create(url: "http://test.com/page#{i}")
      end
    end

    example_request "Sourcelinks listing" do
      expect(status).to eq(200)
      expect(response_body).to eq(Sourcelink.all.to_json)
    end
  end

  post "/sourcelinks" do
    parameter :url, required: true, scope: :sourcelink

    let(:sourcelink_url) { "http://test.com" }
    
    example_request "Create new sourcelink" do
      sourcelink = JSON.parse(response_body)

      expect(status).to eq(200)
      expect(sourcelink.except("id", "created_at", "updated_at")).to eq({
        url: sourcelink_url
      })
    end
  end

  get "/sourcelinks/:id" do
    let(:sourcelink_url) { "http://test.com" }

    let :sourcelink do
      Sourcelink.create(url: sourcelink_url)
    end

    let(:id) { sourcelink.id }
    
    example_request "Get sourcelink by ID" do
      expect(status).to eq(200)
      expect(response_body).to eq(sourcelink.to_json)
    end
  end
end

