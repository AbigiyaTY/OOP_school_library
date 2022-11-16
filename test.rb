require './person.rb'
require './capitalizeDecorator'
require './trimmerDecorator'

person = Person.new(22, name: 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name

# puts person.correct_name