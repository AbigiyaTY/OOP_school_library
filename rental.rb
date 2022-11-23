class Rental
  attr_accessor :data, :book, :person, :rentals

  def initialize(data, book, person)
    @data = data
    @book = book
    @person = person
    @rentals = []
    person.rentals << self
    book.rentals << self
  end

  def create_json
    {
      data: @data,
      title: @book.title,
      id: @person.id
    }
  end
end
