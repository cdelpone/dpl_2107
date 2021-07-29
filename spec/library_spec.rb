require 'spec_helper'

RSpec.describe Author do
  it 'exists with a name' do
    dpl = Library.new("Denver Public Library")

    expect(dpl).to be_a Library
    expect(dpl.name).to eq("Denver Public Library")
  end

  it 'has no books or authors' do
    dpl = Library.new("Denver Public Library")

    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
  end

  it 'can add books and authors' do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
    expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
  end

  it 'has a publication time frame' do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})

    expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})
  end
end


#
# Iteration 4
# Use TDD to implement the following methods on the Library class:
#
# The checkout method takes a Book as an argument. It should return false if a Book does not exist in the library or it is already checked out. Otherwise, it should return true indicating that the book has been checked out.
#
# The checked_out_books method should return an array of books that are currently checked out.
#
# The return method takes a Book as an argument. Calling this method means that a book is no longer checked out.
#
# The most_popular_book method should return the book that has been checked out the most.
#
# dpl = Library.new("Denver Public Library")
# #=> #<Library:0x00007f8c021685b0...>
#
# charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
# #=> #<Author:0x00007f8c01429a98...>
#
# jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
# #=> #<Book:0x00007f8c01433138...>
#
# villette = charlotte_bronte.write("Villette", "1853")
# #=> #<Book:0x00007f8c021d84c8...>
#
# harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
# #=> #<Author:0x00007f8c01442520...>
#
# mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
# #=> #<Book:0x00007f8c019506c0...>
#
# # This book cannot be checked out because it doesn't exist in the library
# dpl.checkout(mockingbird)
# #=> false
#
# # This book cannot be checked out because it doesn't exist in the library
# dpl.checkout(jane_eyre)
# #=> false
#
# dpl.add_author(charlotte_bronte)
#
# dpl.add_author(harper_lee)
#
# dpl.checkout(jane_eyre)
# #=> true
#
# dpl.checked_out_books
# #=> [#<Book:0x00007f8c01433138...>]
#
# # This book cannot be checked out because it is currently checked out
# dpl.checkout(jane_eyre)
# #=> false
#
# dpl.return(jane_eyre)
#
# # Returning a book means it should no longer be checked out
# dpl.checked_out_books
# #=> []
#
# dpl.checkout(jane_eyre)
# #=> true
#
# dpl.checkout(villette)
# #=> true
#
# dpl.checked_out_books
# #=> [#<Book:0x00007f8c01433138...>, #<Book:0x00007f8c021d84c8...>]
#
# dpl.checkout(mockingbird)
# #=> true
#
# dpl.return(mockingbird)
#
# dpl.checkout(mockingbird)
# #=> true
#
# dpl.return(mockingbird)
#
# dpl.checkout(mockingbird)
# #=> true
#
# dpl.most_popular_book
# #=> #<Book:0x00007f8c019506c0...>
