# frozen_string_literal: true

require_relative "openaipoet/runner"

require "thor"

module OpenAIPoet
  class CLI < Thor
    desc "write [seed_title][seed_text]", "Generate a poem with a prompt"
    method_option :lines, aliases: "-n", default: 5
    method_option :poet, aliases: "-p", default: "pushkin"
    def write(seed_title, seed_text)
      lines = options[:lines].to_i
      poet = options[:poet]

      runner = Runner.new
      input = Runner::WriteInput.new(seed_title, seed_text, poet)

      result = runner.write(input, lines)

      puts result.printed
    end

    def self.exit_on_failure?
      true
    end
  end
end
