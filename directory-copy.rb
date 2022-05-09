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


def print(students)
  counter = 0
    while students.length > counter do
      puts "#{counter+1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
      counter += 1
    end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)