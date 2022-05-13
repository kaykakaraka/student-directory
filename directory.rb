#we create an array with all of the students
@students = []

def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice"
#ask for the name
  name = STDIN.gets.chomp
#this will enter the students name as long as they did not enter an empty name
  while !name.empty? do
    #add the name to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    
    name = STDIN.gets.chomp
  end

  @students
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to csv"
  puts "4. Load the students from csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit #this will terminate the program
  else
    puts "I don't know what you mean, try again"
  end
end

def print_header  
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if the file exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if the file doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu