require './rental'
require './book'
require './person'

describe Rental do
  let(:rental) { Rental.new('2020-01-01', Book.new('Title', 'Author'), Person.new(20, 'Name')) }
  context 'when creating a new rental' do
    it 'has a data' do
      expect(rental.data).to eq('2020-01-01')
    end
    it 'has a book' do
      expect(rental.book).to be_a(Book)
    end
    it 'has a person' do
      expect(rental.person).to be_a(Person)
    end
    it 'has a rentals' do
      expect(rental.rentals).to be_a(Array)
    end
  end
end
