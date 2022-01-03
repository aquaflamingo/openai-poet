require_relative "version"
require_relative "runner"
require_relative "poem"
require_relative "poet"
require_relative "config"

require "pry"
require "ruby/openai"

module OpenAIPoet
  class Runner
    class WriteInput
      attr_reader :title, :seed, :poet_style_slug

      def initialize(title, seed, poet_style_slug)
        @title = title
        @seed = seed
        @poet_style_slug = poet_style_slug
      end
    end

    def initialize
      # Hydrate from environment
      config = Config.configure do |conf|
        raise "OPENAI_ACCESS_TOKEN must be specified" unless ENV["OPENAI_ACCESS_TOKEN"]

        conf.access_token = ENV["OPENAI_ACCESS_TOKEN"]
        conf
      end

      @client = OpenAI::Client.new(access_token: config.access_token)
    end

    def write(input, length = 5)
      poet = OpenAIPoet::Poets.find(input.poet_style_slug)
      poem = OpenAIPoet::Poems.sample(poet)
      prompt = prepare_prompt(input, poet, poem)

      response = @client.completions(
        engine: OpenAIPoet::Engine::DAVINCI,
        parameters: {
          prompt: prompt,
          max_tokens: (25 * length)
        }
      )

      compose_poem(input, response.parsed_response, poem, poet)
    end

    private
    # Use the generated values and input to compose the 
    # poem and return this to the user.
    def compose_poem(input, parsed_response, poem, poet)
      id = parsed_response["id"]
      created = parsed_response["created"]
      result = parsed_response["choices"].map { |c| c["text"].lstrip }.first

      poem_lines = [input.seed+"\n"]
      generated_lines = result.split("\n")
      content = poem_lines + generated_lines

      GeneratedPoem.new(
        id: id,
        created: created,
        title: input.title,
        content: content.flatten,
        inspiration: poem.title,
        mimic: poet.full_name
      )
    end

    def prepare_prompt(input, poet, poem)
      <<-PROMPT
A poem in the style of #{poet.full_name}.

Using some of their work as inspiration

Poem Title: #{poem.title}
#{poem.content}

Poem Title: #{input.title}
#{input.seed}
      PROMPT
    end
  end
end
