# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gsa_auctions/version'

Gem::Specification.new do |spec|
  spec.name          = "gsa_auctions"
  spec.version       = GsaAuctions::VERSION
  spec.authors       = ["Alan deLevie"]
  spec.email         = ["alan.delevie@gsa.gov"]
  spec.summary       = %q{Ruby access to the GSA Auctions API}
  spec.description   = %q{
    The GSA Auctions website (www.gsaauctions.gov) offers Federal personal property assets ranging from common place items (such as office equipment and furniture) to more select products like scientific equipment, heavy machinery, airplanes, vessels and vehicles. GSA Auctions online capabilities allow GSA to offer assets located across the country to any interested buyer, regardless of location.
    GSA Auctions API is a public GET API. The Auction listings will be delivered to the user in two formats. One is JSON and the other one is XML. The auction listings delivered thru the API contains the auction listings from all the participating agencies.
  }
  spec.homepage      = ""
  spec.license       = "Public Domain"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  
  spec.add_dependency "curb"
  spec.add_dependency "activesupport"
end
