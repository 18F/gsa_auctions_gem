[![Build Status](https://travis-ci.org/18F/gsa_auctions_gem.svg)](https://travis-ci.org/18F/gsa_auctions_gem)

# GsaAuctions

Ruby access to the GSA Auctions API.

From http://gsa.github.io/auctions_api:

> The Auctions API is a GET API which has currently one operation. The operation will retrieve GSA Auctions, auctions data.

> A couple basic notes: The rate limits for the API are currently 5,000 calls/day and 5 calls per 5 seconds. As we go forward and understand the impact of usage of the API, we will adjust the limits accordingly as well as allow for individual users with specific needs to have customized rate limits appropriate to their use.

You can get a free API key at https://api.data.gov/signup/.

## Installation

Add this line to your application's Gemfile:

    gem 'gsa_auctions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gsa_auctions

## Usage

```ruby
client = GsaAuctions::Client.new(api_key: GsaAuctions::Protocol::DEMO_KEY)
response = client.get_api(format: 'xml')

# do something with response.body
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gsa_auctions/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

### Testing

```sh
$ rspec spec
```

### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
