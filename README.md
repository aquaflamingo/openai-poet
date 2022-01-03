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
bundle exec exe/openaipoet write "Sights", "For we work these damn years, only to see from hollowed sights,"

# output:

Sights

For we work these damn years, only to see from hollowed sights,
Something greener than our future, something greater than our plight,
Our one-eyed concubine of garden nights, the honeyed leer of the moon,
Something nearing us, something nearing us to kill us through or in our dream,
Our suicides of boredom, casually exact in memorized grief.

When the future came I was in bed and dreaming, and I was glad,
A clear dose of the world, to worry me--and then another, without end.

--------------------------
Id: <id is here>
Created: 1641243648
In the style of: Alfred Housman
Inspired by: As I Gird On For Fighting
```

### Supported Poets

* Alexander Pushkin
* Alfred Housman

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aquaflamingo/openaipoet. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/aquaflamingo/openaipoet/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OpenAIPoet project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aquaflamingo/openaipoet/blob/master/CODE_OF_CONDUCT.md).
