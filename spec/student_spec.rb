require './student'

describe Student do
  let(:student) { Student.new('Classroom', 15, 'John') }

  it 'has a classroom' do
    expect(student.classroom).to eq('Classroom')
  end

  it 'has an age' do
    expect(student.age).to eq(15)
  end

  it 'has a name' do
    expect(student.name).to eq('John')
  end
end
