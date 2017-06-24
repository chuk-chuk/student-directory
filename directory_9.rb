@students = Array.new # an empty array accessible to all methods
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
  puts "Please enter at least one student and start by typing a name below"
  puts "to finish, just hit return twice"
  puts "Type a student name:"
  name = gets.delete!("\n").capitalize

  while !name.empty? do
    puts "Cohort:"
    cohort = gets.delete!("\n")
    cohort == "" ? cohort = :tbc : cohort = cohort.to_sym
    puts "Country of birth:"
    country = gets.delete!("\n").capitalize
    puts "Gender(F/M):"
    gender = gets.delete!("\n")
    puts "Age:"
    age = gets.delete!("\n")

    @students << {name: name, cohort: cohort, country: country, gender: gender, age: age}
    puts "We have a total of #{@students.count} student" if @students.count == 1
    puts "We have a total of #{@students.count} students" if @students.count > 1
    puts "Type a name of the next student or hit enter and select the next option from the menu:"
    name = gets.delete!("\n").capitalize
  end
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, gender, age, cohort, country = line.chomp.split(",")
    @students << {name: name.to_sym, cohort: cohort.to_sym, country: country.to_sym, gender: gender.to_sym, age: age.to_sym}
  end
  file.close
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_date = [student[:name], student[:gender], student[:age], student[:cohort], student[:country]]
    csv_line = student_date.join(",")
    file.puts csv_line
  end
  file.close
end

def print_header
  puts "The students of Villians Academy".center(50)
  puts "-------------".center(50)
end

def print_student_list
  if @students.empty?
    puts "No information available".center(50)
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
end

interactive_menu
