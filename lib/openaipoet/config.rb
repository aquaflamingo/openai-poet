module OpenAIPoet
  module Config
    class Configuration
      attr_accessor :access_token
    end

    class << self
      attr_writer :configuration
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield configuration
    end
  end
end
