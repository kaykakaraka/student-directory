#we invite the user to create an array of students
def input_students
  puts "Please enter the details of the students."
  puts "To finish, just hit return twice"
#create an empty array of students
  students = []
#ask for the name
  puts "Name?"
  name = gets.chomp
#this will enter the students name as long as they did not enter an empty name
  while !name.empty? do
    #ask for further details
    puts "Hobbies?"
    hobbies = gets.chomp
      if hobbies.empty? then hobbies = "<no hobbies listed>" end
    puts "Height?"
    height = gets.chomp
      if height.empty? then height = "<no height listed>" end
    #create a hash with the details and add this to the array
    students << {name: name, cohort: :november, hobbies: hobbies, height: height}
    puts "Now we have #{students.count} students"
    
    puts "Now for the next student. Name?"
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
      puts "Hobbies: #{students[counter][:hobbies]}"
      puts "Height: #{students[counter][:height]}"
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