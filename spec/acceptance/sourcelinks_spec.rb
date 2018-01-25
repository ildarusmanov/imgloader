require "acceptance_helper"

resource "Sourcelinks" do
  get "/sourcelinks" do
    before do
      5.times do |i|
        Sourcelink.create(url: => "http://test.com/page#{i}")
      end
    end

    example "Sourcelinks listing" do
      do_request

      status.should == 200
      expect(response_body).to eq(Sourcelink.all.to_json)
    end
  end

  post "/sourcelinks" do
    parameter :url, required: true, scope: :sourcelink

    let(:sourcelink_url) { "http://test.com" }
    
    example "Create new sourcelink" do
      do_request

      sourcelink = JSON.parse(response_body)

      status.should == 200
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
    
    example "Get sourcelink by ID" do
      do_request

      status.should == 200

      expect(response_body).to eq(sourcelink.to_json)
    end
  end
end

