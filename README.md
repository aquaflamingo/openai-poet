# OpenAIPoet
Using Open AI and GPT-3 to generate poems

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'openaipoet'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install openaipoet

## Usage

Ensure that your OpenAI API key is set in the environment:

```bash
export OPENAI_ACCESS_TOKEN=your-token-123
```

Then you can run the executable and supply a seed title and seed text to have it write a poem for you:
```bash
bundle exec exe/openaipoet write "Snowflakes", "For we work these damn years, only to see from hollowed sights,"

# output:

Snowflakes

For we work these damn years, only to see from hollowed sights,
The ill-famed seasons fluttering to and fro.
And they cant know what lies, beyond their mind's vision,
That an ill angel comes, to claim blighted vision,
But I though ill, will melt this pain and purge my mind,
As I kneel, praying and staring into winter.
For we sit upon times that are proud and dare not speak,
Blaming them ill and trying, to take these years that weep.
But I though ill, will plant some seeds and make them grow,
I shall grow these trees and bless their fruit,
That we

--------------------------
Id: ID
Created: 1641243034
In the style of: Alexander Pushkin
Inspired by: Tempest
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aquaflamingo/openaipoet. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/aquaflamingo/openaipoet/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OpenAIPoet project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aquaflamingo/openaipoet/blob/master/CODE_OF_CONDUCT.md).
