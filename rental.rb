class Rental
  attr_accessor :data, :book, :person

  def initialize(data, book, person)
    @data = data
    @book = book
    book.rental << self
    @person = person
    person.rental << self
  end
end
