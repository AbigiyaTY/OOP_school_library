require './classroom'

describe Classroom do
  let(:classroom) { Classroom.new('12') }
  context 'when creating a new classroom' do
    it 'has a label' do
      expect(classroom.label).to eq('12')
    end
  end
end
