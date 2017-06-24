#replacing the chomp() method to get rid of the last return character
def input_students
  puts "Please enter the required information of the students below."
  puts "To finish, just hit return twice"

  students = Array.new
  puts "Type a student name:"
  name = gets.delete!("\n")

  while !name.empty? do
    puts "Cohort:"
    cohort = gets.delete!("\n")
    cohort == "" ? cohort = :tbc : cohort = cohort.to_sym
    puts "Country of birth:"
    country = gets.delete!("\n")
    puts "Favorite hobby:"
    hobby = gets.delete!("\n")
    puts "Age:"
    age = gets.delete!("\n")

    students << {name: name, cohort: cohort, country: country, hobby: hobby, age: age}
    puts "We have a total of #{students.count} students"
    puts "Type a name of the next student or finish by hitting a return key:"
    name = gets.delete!("\n")
  end
  students
end

def centered(string)
  width = 50
  string.center(width)
end

def print_header
  centered("The students of Villians Academy")
  centered( "-------------")
end

def print(students)
  students.sort_by! {|person| person[:cohort]}
  person = 0
	while person < students.length
	 	puts "#{person + 1}.#{students[person][:name]}, #{students[person][:age]}, #{students[person][:cohort]} cohort, originaly from #{students[person][:country]} who loves #{students[person][:hobby]}."
	 	person += 1
	 end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student" if students.count == 1
  puts "Overall, we have #{students.count} great students" if students.count > 1
end

students = input_students
print_header
print(students)
print_footer(students)
