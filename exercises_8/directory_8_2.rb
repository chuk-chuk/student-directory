#We're modifying the program to only print the students whose name begins with a specific letter.

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
  puts "Type a first letter of the name:"
  letter = gets.chomp
  students.each_with_index do |student, index|
    if student[:name].chars.first == letter
    puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
