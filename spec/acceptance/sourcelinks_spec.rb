require "acceptance_helper"

resource "Sourcelinks" do
  get "/sourcelinks" do
    before do
      5.times do |i|
        create(:sourcelink)
      end
    end
    
    example_request "Sourcelinks listing" do
      parsed = JSON.parse(response_body)

      expect(status).to eq(200)
      expect(parsed["count"]).to eq(Sourcelink.count)
    end
  end

  post "/sourcelinks" do
    parameter :url, required: true, scope: :sourcelink

    let(:sourcelink_url) { "http://test.com" }

    before do
      stub_request(:any, sourcelink_url)
        .to_return(body: "test", status: 200)
    end
 
    example_request "Create new sourcelink" do
      parsed = JSON.parse(response_body)

      expect(status).to eq(200)
      expect(parsed["url"]).to eq(sourcelink_url)
    end
  end

  get "/sourcelinks/:id" do
    let :sourcelink do
      create(:sourcelink)
    end

    let(:id) { sourcelink.id }
    
    example_request "Get sourcelink by ID" do
      parsed = JSON.parse(response_body)

      expect(status).to eq(200)
      expect(parsed["id"]).to eq(sourcelink.id)
      expect(parsed["url"]).to eq(sourcelink.url)
    end
  end
end

