require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @book = []
    @people = []
    @rentals = []
  end

  def welcome
    puts "Welcome to school library app!"

    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
  end

  def main
    option = gets.chomp
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_for_person_id
    when '7'
      puts 'Thank you for using this app!'
      exit 0
    else
      puts 'That is not a valid option'
    end
    puts ' '
  end

  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    person_type = gets.chomp
    if person_type == '1'
      create_student
    elsif person_type == '2'
      create_teacher
    else
      puts 'That is not a valid input'
      return
    end
  end

  def create_student
    print "Age: "
    age = gets.chomp
    print "Name: "
    name = gets.chomp
    print "Class room: "
    classroom = gets.chomp
    print "Has parent permission? [Y/N]: "
    parent_permission = gets.chomp.downcase
    case parent_permission
    when "y"
      @people.push(Student.new(classroom, age, name, parent_permission: true))
    when "n"
      @people.push(Student.new(classroom, age, name, parent_permission: false))
    else
      puts "Invalid input"
    end
    puts "Student created successfully"
    welcome
    main
  end

  def create_teacher
    print "Age: "
    age = gets.chomp
    print "Name: "
    name = gets.chomp
    print "Specialization: "
    specialization = gets.chomp
    parent_permission = true
    @people << Teacher.new(age, specialization, name, parent_permission: true)
    puts "Teacher created successfully"
    welcome
    main
  end

  def create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    @book << Book.new(title, author)
    puts "Book created successfully"
    welcome
    main
  end

  def create_rental
    puts "Select a book from the following list by number"
    @book.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp
    puts "Select a person from the following list by number (not id)"
    @people.each_with_index { |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    }
    person_index = gets.chomp
    print "Date: "
    date = gets.chomp
    @rentals << Rental.new(date, book = @book[book_index.to_i], person = @people[person_index.to_i])
    puts "Rental created successfully"
    welcome
    main
  end

  def list_books
    @book.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    welcome
    main
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    welcome
    main
  end

  def list_rentals_for_person_id
    print "ID of person: "
    id = gets.chomp.to_i
    puts "Rentals: "
    @rentals.each { |rental|
      puts "Date: #{rental.data}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    }
    welcome
    main
  end
end
