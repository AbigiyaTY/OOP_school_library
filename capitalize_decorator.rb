require './base_decorator'

class CapitalizedPerson < baseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
