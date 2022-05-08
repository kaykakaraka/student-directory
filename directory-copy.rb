#we invite the user to create an array of students
def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice"
#create an empty array of students
  students = []
#ask for the name
  name = gets.chomp
#this will enter the students name as long as they did not enter an empty name
  while !name.empty? do
    #create a hash with the name and cohort and add this to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    
    name = gets.chomp
  end

  students
end

def print_header  
  puts "The students of Villains Academy"
  puts "-------------"
end

#A method for the user to select a letter.
def select_letter
  puts "Please choose a letter."
  letter = gets.chomp.downcase
end

#this method takes the array of students and also the chosen letter as parameters
def print(students, letter)
  students.each_with_index do |student, index|
    #check for the letter in the students name
    if student[:name][0].downcase == letter
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
letter = select_letter
print_header
print(students, letter)
print_footer(students)