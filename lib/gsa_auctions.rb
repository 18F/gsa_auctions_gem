require 'curb'
require 'json'
require 'active_support/core_ext/hash/conversions'
require 'gsa_auctions/version'

module GsaAuctions
  class Error < StandardError
    def initialize(message)
      super(message)
    end
  end
  
  module Util
    def self.hash_to_query(hash)
      URI.encode_www_form(hash)
    end
  end
  
  module Protocol
    DEMO_KEY = "DEMO_KEY"
    BASE_URL = "https://api.data.gov"
    API_PATH = "gsa/auctions"
    
    XML_FORMAT = "xml"
    JSON_FORMAT = "json"
    DEFAULT_FORMAT = XML_FORMAT
    VALID_FORMATS = [XML_FORMAT, JSON_FORMAT]
    
    def self.api_url
      "#{BASE_URL}/#{API_PATH}"
    end
  end
  
  class Client
    def initialize(params={})
      @api_key = params[:api_key] if params.has_key?(:api_key)
    end
    
    def get_api(options={})
      options[:api_key] = @api_key
      options[:format]  = GsaAuctions::Protocol::DEFAULT_FORMAT unless options[:format].is_a?(String)
      
      get(GsaAuctions::Protocol.api_url, options)
    end
    
    def get(path, options={})
      query = GsaAuctions::Util.hash_to_query(options)
      url = "#{path}?#{query}"
      response = Curl.get(url)
      
      handle_response(response, options[:format])
    end
    
    private
    
      def parse(json_or_xml_string, format)
        formats = GsaAuctions::Protocol::VALID_FORMATS
        if !formats.include?(format)
          message = "Invalid format given (#{format}). Please choose from: #{formats}"
          raise GsaAuctions::Error.new(message)
        end
        
        return Hash.from_xml(json_or_xml_string) if format == 'xml'
        return JSON.parse(json_or_xml_string)    if format == 'json'
      end
    
      def handle_response(response, format)
        raise GsaAuction::Error.new(response.status) if response.response_code != 200
        parsed_response = parse(response.body_str, format)
                
        GsaAuctions::Response.new(parsed_response)
      end
  end
  
  class Response
    attr_reader :body
    
    def initialize(body)
      @body = body
    end
  end
end
