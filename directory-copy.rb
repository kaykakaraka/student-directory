#we invite the user to create an array of students
def input_students
  puts "Please enter the details of the students."
  puts "To finish, just hit return twice"
#create an empty array of students
  students = []
#ask for the name
  puts "Name?"
  name = gets.gsub(/\n/, "")
#this will enter the students name as long as they did not enter an empty name
  while !name.empty? do
    #ask for cohort
    puts "Cohort"
    cohort = gets.chomp.to_sym
      if cohort.empty? then cohort = "<no cohort listed>" end
    #create a hash with the details and add this to the array
    students << {name: name, cohort: cohort}
      if students.count == 1
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end

    puts "Now for the next student. Name?"
    name = gets.chomp
  end
  
  #sort students by the cohort value so that they print next to students of the same cohort
  students.sort_by {|student| student[:cohort]}
end

def print_header  
  puts "The students of Villains Academy".center(60)
  puts "-------------".center(60)
end


def print(students)
  counter = 0
    while students.length > counter do
      puts "#{counter+1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)".center(60)
      counter += 1
    end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(60)
  else
    puts "Overall, we have #{students.count} great student".center(60)
  end
end

students = input_students
if students.count > 0
  print_header
  print(students)
  print_footer(students)
end

