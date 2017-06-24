#printing the list only if there is at least one student enrolled
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
    puts "We have a total of #{students.count} students"
    puts "Type a name of the next student or finish by hitting a return key:"
    name = gets.delete!("\n").capitalize
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
  if students.empty?
    puts "No information available"
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

students = input_students
print_header
print(students)
print_footer(students)
