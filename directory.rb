require 'csv'

@students = Array.new # an empty array accessible to all methods
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to the file"
  puts "4. Load the list from the file"
  puts "5. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      puts "Enter your file name:"
      yourfile = STDIN.gets.chomp
      save_students(yourfile)
    when "4"
      puts "Enter your file name:"
      yourfile = STDIN.gets.chomp
      load_students(yourfile)
    when "5"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter at least one student and start by typing a name below"
  puts "Type a student name:"
  name = STDIN.gets.chomp.capitalize

  while !name.empty? do
    puts "Cohort:"
    cohort = STDIN.gets.chomp.capitalize
    cohort == "" ? cohort = "tbc": cohort = cohort
    puts "Country of birth:"
    country = STDIN.gets.chomp.capitalize
    puts "Gender(F/M):"
    gender = STDIN.gets.chomp.capitalize
    puts "Age:"
    age = STDIN.gets.chomp.capitalize
    add_students(name, gender, age, cohort, country)
    puts "We have a total of #{@students.count} student" if @students.count == 1
    puts "We have a total of #{@students.count} students" if @students.count > 1
    puts "Type a name of the next student or hit enter and select the next option from the menu:"
    name = STDIN.gets.chomp.capitalize
  end
end

def add_students(name, gender, age, cohort, country)
  @students << {name: name, cohort: cohort, country: country, gender: gender, age: age}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villians Academy".center(50)
  puts "-------------".center(50)
end

def print_student_list
  if @students.empty?
    puts "No information available".center(50)
    puts ""
  else
    @students.sort_by! {|person| person[:cohort]}
    person = 0
	while person < @students.length
	 	puts "#{person + 1}.#{@students[person][:name]}, #{@students[person][:gender]}, #{@students[person][:age]}, #{@students[person][:cohort]} cohort, originaly from #{@students[person][:country]}"
	 	person += 1
	 end
 end
end

def print_footer
  puts "Overall, we have #{@students.count} great student" if @students.count == 1
  puts "Overall, we have #{@students.count} great students" if @students.count > 1
  puts "What would you like to do next?"
  puts ""
end

def save_students(yourfile)
  if yourfile.to_s.empty?
    puts "Enter your file name:"
    yourfile = STDIN.gets.chomp
    save_students(yourfile)
  else
  #open the file for writing
    CSV.open(yourfile, "w") do |csv|
    #iterate over the array of students
      @students.each do |student|
      csv << [student[:name], student[:gender], student[:age], student[:cohort], student[:country]]
      end
    end
    puts "List saved to #{yourfile} file"
    puts ""
  end
end

def load_students(yourfile)
  if yourfile.to_s.empty?
    yourfile = "student.csv"
    load_students(yourfile)
  elsif File.exists?(yourfile)
    CSV.foreach(yourfile) do |row|
      name, gender, age, cohort, country = row
      add_students(name, gender, age, cohort, country)
      #@students << {name: name, cohort: cohort.to_sym, country: country, gender: gender, age: age}
    end
    puts "Loaded #{@students.count} from #{yourfile}"
    puts ""
    puts "What would you like to do next?"
  else
  puts "File #{yourfile} doesn't exist."
  end
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doedn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit #quit the program
  end
end

try_load_students
interactive_menu
