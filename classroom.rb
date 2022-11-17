class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def student(students)
    @students << students
    students.classroom = self
  end
end
