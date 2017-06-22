#Using method center() to make the output beautifully aligned

def input_students
  puts "Please enter the required information of the students below."
  puts "To finish, just hit return twice"

  students = Array.new
  puts "Type a student name:"
  name = gets.chomp

  while !name.empty? do
    puts "Country of birth:"
    country = gets.chomp
    puts "Favorite hobby:"
    hobby = gets.chomp
    puts "Age:"
    age = gets.chomp

    students << {name: name, cohort: :november, country: country, hobby: hobby, age: age}
    puts "Now we have #{students.count} students"
    puts "Type a name of the next student or finish hitting a return key:"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villians Academy".center(50)
  puts "______________".center(50)
end

def print(students)
  person = 0
	while person < students.length
		puts "#{person + 1}.#{students[person][:name]}, #{students[person][:age]}, #{students[person][:cohort]} cohort, originaly from #{students[person][:country]}, who loves #{students[person][:hobby]}."
		person += 1
	end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
