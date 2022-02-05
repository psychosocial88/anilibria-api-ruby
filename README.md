# anilibria-api-ruby

Ruby wrapper for [AniLibria API](https://github.com/anilibria/docs/blob/master/api_v2.md).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'anilibria-api-ruby'
```

And then execute:

```shell
$ bundle install
```

Or install it yourself as:

```shell
$ gem install anilibria-api-ruby
```

## Usage

### Client

Usage example:

```ruby
require 'anilibria/api'

anilibria = Anilibria::Api::Client.new

anilibria.get_years # => [1996, 1998, 2001, 2003, 2004, 2005, 2006, ...]

title = anilibria.get_title(code: 'steinsgate') # => #<Anilibria::Api::Types::Title id=8674 ...
title.names.en # => "Steins;Gate"
```

`anilibria` object implements [AniLibria API methods](https://github.com/anilibria/docs/blob/master/api_v2.md#method-list) as is. All methods are available in *snake_case* notation. Same with the `title` object - it implements the [Title](https://github.com/anilibria/docs/blob/master/api_v2.md#возвращаемые-значения-при-запросе-информации-о-тайтле) specification.

### Authorization

The gem supports authorization:

```ruby
# session = anilibria.auth('wrong@example.com', 'WrongPassword') # => nil

# session = anilibria.auth!('wrong@example.com', 'WrongPassword')
# (raises an error Anilibria::Api::Exceptions::AuthError)

session = anilibria.auth('correct@example.com', 'CorrectPassword') # returns the session string

anilibria.add_favorite(title_id: 9114, session: session) # => true

titles = anilibria.get_favorites(filter: 'id,code,names,description', session: session)
# => [#<Anilibria::Api::Types::Title id=9114 code="shingeki-no-k...
```

### API Version

You can get the currently used version of [AniLibria API](https://github.com/anilibria/docs/blob/master/api_v2.md): 

```ruby
anilibria.api_version # => "2.13.10"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/psychosocial88/anilibria-api-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
