class Rental
  attr_accessor :data, :book, :person

  def initialize(data)
    @data = data
    @book = book
    book.rental << self
    @person = person
    person.rental << self
  end
end
