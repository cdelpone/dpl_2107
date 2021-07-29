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

  it 'checks out books' do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    # This book cannot be checked out because it doesn't exist in the library
    expect(dpl.checkout(mockingbird)).to eq(false)
    # This book cannot be checked out because it doesn't exist in the library
    expect(dpl.checkout(jane_eyre)).to eq(false)
  end
end

# dpl.add_author(charlotte_bronte)
# dpl.add_author(harper_lee)
#
# expect(dpl.checkout(jane_eyre)).to eq(true)
#
# expect(dpl.checked_out_books).to eq([jane_eyre])
#
# # This book cannot be checked out because it is currently checked out
# expect(dpl.checkout(jane_eyre)).to eq(false)
#
# dpl.return(jane_eyre)
# # Returning a book means it should no longer be checked out
# expect(dpl.checked_out_books).to eq([])
#
# expect(dpl.checkout(jane_eyre)).to eq(true)
#
# expect(dpl.checkout(villette)).to eq(true)
#
# expect(dpl.checked_out_books).to eq([jane_eyre, villette])
#
# expect(dpl.checkout(mockingbird)).to eq(true)
#
# dpl.return(mockingbird)
#
# expect(dpl.checkout(mockingbird)).to eq(true)
#
# dpl.return(mockingbird)
#
# expect(dpl.checkout(mockingbird)).to eq(true)
#
# expect(dpl.most_popular_book).to eq(mockingbird)
