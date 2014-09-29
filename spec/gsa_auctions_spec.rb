require 'spec_helper'

describe GsaAuctions do
  let(:api_key) { ENV['GSA_AUCTIONS_API_KEY'] || GsaAuctions::Protocol::DEMO_KEY }
  
  vcr_options = { 
    cassette_name: "gsa_auctions", 
    record: :new_episodes 
  }
  describe GsaAuctions::Client, vcr: vcr_options do
    context "instantiation" do
      it "instantiates without an API key" do
        client = GsaAuctions::Client.new    
        expect(client).to(be_a(GsaAuctions::Client))
      end
  
      it "instantiates with an API key in a params hash" do
        client = GsaAuctions::Client.new(api_key: api_key)
        expect(client).to(be_a(GsaAuctions::Client))
      end
  
      it "instantiates with a demo key" do
        client = GsaAuctions::Client.new(api_key: GsaAuctions::Protocol::DEMO_KEY)
        expect(client).to(be_a(GsaAuctions::Client))
      end
    end
  
    context "http calls" do
      let(:client) { GsaAuctions::Client.new(api_key: api_key) }
    
      it "GETs XML data by default" do
        response = client.get_api
        expect(response).to(be_a(GsaAuctions::Response))
      end
      
      it "GETs XML data explicitly" do
        response = client.get_api({format: 'xml'})
        expect(response).to(be_a(GsaAuctions::Response))
      end
      
      it "GETs JSON data explicitly" do
        pending "The API appears to return invalid JSON"
        response = client.get_api({format: 'json'})
        expect(response).to(be_a(GsaAuctions::Response))
      end
    end
  end
  
  describe GsaAuctions::Response, vcr: vcr_options do
    let(:mock_response) do
      {
        "Response" => {
          "mock_key" => "mock_value"
        }
      }
    end
    
    it "takes a Hash as an argument in the constructor" do
      response = GsaAuctions::Response.new(mock_response)
      expect(response).to(be_a(GsaAuctions::Response))
    end
    
    it "has a body attribute which returns a Hash" do
      response = GsaAuctions::Response.new(mock_response)
      expect(response).to(respond_to(:body))
      expect(response.body).to(be_a(Hash))
    end
  end
end
