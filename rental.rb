class Rental
  attr_accessor :data
  attr_reader :book, :person

  def initialize(data, book, person)
    @data = data
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def create_json
    {
      data: data,
      book: book.create_json,
      person: person.create_json
    }
  end
end
