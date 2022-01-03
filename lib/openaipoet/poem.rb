module OpenAIPoet
  # Represents an individual existing poem
  class Poem
    attr_reader :author, :title, :content

    def initialize(author, title, content)
      @author = author
      @title = title
      @content = content
    end
  end

  class Poems
    def self.sample(poet)
      pf = OpenAIPoet::PoemFinder.new(poet)
      pf.sample
    end
  end

  # PoemFinder is a retrieval object for interacting with the file data for poems
  class PoemFinder
    POEM_PATH = "lib/openaipoet/poems/"

    def initialize(poet)
      @poet = poet
    end

    def all
      path = poet_works_dir_path(@poet.slug)

      Dir.glob(File.join(path, "*.txt")).map do |f_path|
        # Read the file's contents into variable
        content = File.read(f_path)

        # Extract the poem name with underscore separated names
        poem_name = extract_poem_name(f_path)

        Poem.new(@poet, poem_name, content)
      end
    end

    def sample
      all.sample
    end

    private

    # Extracts a poem's formal name included title case
    # from a poem file path.
    #
    # @example
    #   path/to/poem/the_tempest.txt => "The Tempest"
    #
    def extract_poem_name(f_path)
      File.basename(f_path, ".txt").split("_").map do |name_split|
        # Capitalize the first letter of each token in the name
        name_split.capitalize
      end.join(" ")
    end

    # Returns the directory associated with the poet's
    # works found using the lookup slug.
    def poet_works_dir_path(slug = "")
      File.join(POEM_PATH, slug, "/")
    end
  end

  # An AI generated Poem
  class GeneratedPoem
    attr_reader :title, :content, :id, :created, :mimic, :inspiration

    def initialize(id:, title:, content:, created:, mimic:, inspiration:)
      @title = title
      @id = id
      @mimic = mimic
      @inspiration = inspiration
      @content = content
      @created = created
    end

    def printed
    <<-POEM
#{title}

#{full_text}

--------------------------
Id: #{id}
Created: #{created}
In the style of: #{mimic}
Inspired by: #{inspiration}
    POEM
    end

    def full_text
      content.map(&:strip).join("\n")
    end
  end
end
