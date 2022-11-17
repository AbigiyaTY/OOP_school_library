class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def rentals(rental)
    @rental = rental
    rental.book = self
  end
end
