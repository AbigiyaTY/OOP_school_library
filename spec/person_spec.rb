require './person'

describe Person do
  let(:person) { Person.new(20, 'John') }
  context 'when creating a new person' do
    it 'has an age' do
      expect(person.age).to eq(20)
    end
    it 'has a name' do
      expect(person.name).to eq('John')
    end
  end
end
