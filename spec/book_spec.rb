require './book'

describe Book do
  let(:book) { Book.new('Book 1', 'Title 1') }
  context 'when creating a new book' do
    it 'has a title' do
      expect(book.title).to eq('Book 1')
    end

    it 'has an author' do
      expect(book.author).to eq('Title 1')
    end
  end
end
