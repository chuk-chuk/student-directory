def interactive_menu
#repeat step
students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit #this will cause a programm to terminate
      else
        puts "I don't know what you mean, try again"
    end
  end
end

def input_students
  puts "Please enter at least one student and start by typing a name below"
  puts "to finish, just hit return twice"

  students = Array.new
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

    students << {name: name, cohort: cohort, country: country, gender: gender, age: age}
    puts "We have a total of #{students.count} student" if students.count == 1
    puts "We have a total of #{students.count} students" if students.count > 1
    puts "Type a name of the next student or finish by hitting a return key:"
    name = gets.delete!("\n").capitalize
  end
  students
end

def print_header
  puts "The students of Villians Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  if students.empty?
    puts "No information available".center(50)
  else
  students.sort_by! {|person| person[:cohort]}
  person = 0
	while person < students.length
	 	puts "#{person + 1}.#{students[person][:name]}, #{students[person][:gender]}, #{students[person][:age]}, #{students[person][:cohort]} cohort, originaly from #{students[person][:country]}"
	 	person += 1
	 end
 end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student" if students.count == 1
  puts "Overall, we have #{students.count} great students" if students.count > 1
end

interactive_menu
# students = input_students
# print_header
# print(students)
# print_footer(students)
