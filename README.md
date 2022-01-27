# M360
A plugin that helps you use M360 APIs using the Ruby language.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'm360'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install m360

## Usage

For Globelabs users

```ruby
client = M360::SMS::Globelabs.new(
    passphrase: 'your-passphrase-here',
    correlator: 'correlator',
    sender: 'masking-name-here',
    address: '9123456789',
    message: 'Hello, World!'
)

# sends http request to m360s API
client.call

# check if successful
client.success?
```

You may also use your environement variables to set `passphrase` and `sender`.

```ruby
ENV['M360_GLABS_PASSPHRASE']
ENV['M360_GLABS_SENDER']
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/m360. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/m360/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the M360 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/m360/blob/master/CODE_OF_CONDUCT.md).
