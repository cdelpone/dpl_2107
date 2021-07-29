class Author
attr_reader :first_name,
            :last_name,
            :name,
            :books

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @name = @first_name + ' ' + @last_name
    @books = []
  end

  def write(title, publication_date)
    book_title = (title.split(' ').first + '_' + title.split(' ').last).downcase

    @books << book_title = Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: publication_date})

    book_title
  end
end
