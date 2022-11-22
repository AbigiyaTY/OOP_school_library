require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
require './data_store'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @book = []
    @people = []
    @rentals = []
    @book_store = DataStore.new('book')
    @book = @book_store.read.map { |book| Book.new(book['title'], book['author']) }
    @rentals_store = DataStore.new('rentals')
    @rental = @rentals_store.read.map {|rental| Rental.new(rental['data'], rental['book'], rental['person']) }
  end

  def list_options
        option = gets.chomp.to_s
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
        puts 'File saved successfully!'
        puts 'Thank you for using this app!'
        close
        exit 0
        end
    end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Class room: '
    classroom = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'y'
      @people.push(Student.new(classroom, age, name, parent_permission: true))
    when 'n'
      @people.push(Student.new(classroom, age, name, parent_permission: false))
    else
      puts 'Invalid input'
    end
    puts 'Student created successfully'
    welcome
    list_options
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name, parent_permission: true)
    puts 'Teacher created successfully'
    welcome
    list_options
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @book << Book.new(title, author)
    puts 'Book created successfully'
    welcome
    list_options
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @book.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @book[book_index.to_i], @people[person_index.to_i])
    puts 'Rental created successfully'
    welcome
    list_options
  end

  def list_books
    @book.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    welcome
    list_options
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    welcome
    list_options
  end

  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.data}, Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'No rentals found for that ID'
      end
    end
    welcome
    list_options
  end

  def close
    @book_store.write(@book.map(&:create_json))
    @rentals_store.write(@rental.map(&:create_json))
  end

end
