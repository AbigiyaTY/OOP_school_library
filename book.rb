class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rental(rental)
    @rentals = rental
    rental.book = self
  end
end
