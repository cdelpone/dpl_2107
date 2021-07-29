class Library
attr_reader :name,
            :books,
            :authors

  def initialize(name, books = [])
    @name = name
    @authors = []
    @books = books
  end

  def add_author(author)
    @authors << author
  end

  def books
    @authors.flat_map do |author|
      author.books
    end
  end

  def publication_time_frame_for(author)
    pub_time = {}
    pub_years = []

    author.books.map do |book|
      pub_years << book.publication_year
    end

    sort_years = pub_years.sort_by do |year|
      year
    end
      pub_time[:end] = sort_years.last
      pub_time[:start] = sort_years.first
      pub_time
    end


end

# pub_years.each do |max_year|
#   pub_time[:end] ||= max_year
# end
# pub_years.min_by do |min_year|
#   pub_time[:start] ||= min_year
# end
