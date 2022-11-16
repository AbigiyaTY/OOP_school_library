require './base_decorator'

class capitalizedPerson < baseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
