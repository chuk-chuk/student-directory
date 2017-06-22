#Rewriting code using while control flow method that prints all students

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = Array.new
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "______________"
end

def print(students)

	# i = 0
	# while i < students.length
	# 	puts "#{students[i][:name]} #{students[i][:cohort]} cohort"
	# 	i += 1
	# end
  person = 0
	while person < students.length
		puts "#{person + 1}.#{students[person][:name]} #{students[person][:cohort]} cohort"
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
