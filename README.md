# PodcastReader

Gem to fetch information about podcast RSS

## Installation

Add this line to your application's Gemfile:

    gem 'podcast_reader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install podcast_reader

## Usage

You just need use PodcastReader::Podcast with url in params

```ruby
require 'podcast_reader'
podcast = PodcastReader::Podcast.new('http://feeds.feedburner.com/RubyRogues')
podcast.entries.each do |entry|
  p entry
end
```

If you want choose all HTTP Adapter define by Faraday.

By example if you want use the adapter Typhoeus you can do

```ruby
Faraday.default_adapter = :typhoeus
```

You can parse the XML in rss feed with all adapter define in multi_xml.
By example if you want use the Ox parser

```ruby
MultiXml.parser = :ox
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
