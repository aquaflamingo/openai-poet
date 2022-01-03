module OpenAIPoet
  # An individual poet and their associated meta data
  class Poet
    attr_reader :first, :last, :born, :died, :origin, :slug

    def initialize(first, last, origin, born, died, slug)
      @first = first
      @last = last
      @origin = origin
      @born = born
      @died = died
      @slug = slug
    end

    def life
      "#{@born}-#{@died}"
    end

    def full_name
      "#{@first} #{@last}"
    end
  end

  # Collection of all poets in this application
  module Poets
    Pushkin = Poet.new("Alexander", "Pushkin", "Russia", "1799", "1837", "pushkin")

    ALL = {
      "pushkin" => Pushkin
    }.freeze

    def self.find(slug)
      raise "poet not found" if ALL[slug].nil?

      ALL[slug]
    end
  end
end
