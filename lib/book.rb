class Book
attr_reader :author_first_name,
            :author_last_name,
            :title,
            :publication_date,
            :author
  def initialize(info)
    @author_first_name = info[:author_first_name]
    @author_last_name = info[:author_last_name]
    @title = info[:title]
    @publication_date = info[:publication_date]
    @author = @author_first_name + ' ' + @author_last_name
  end

  def publication_year
    @publication_date.chars.last(4).join
  end
end
