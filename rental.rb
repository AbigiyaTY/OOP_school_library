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
      id: @person.id,
      bookObj: { title: @book.title, author: @book.author },
      personObj: { age: @person.age, name: @person.name }
    }
  end
end
