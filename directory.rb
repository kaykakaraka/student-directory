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
    add_students(name)
    puts "Now we have #{@students.count} students"
    
    name = STDIN.gets.chomp
  end

  @students
end

def interactive_menu
  loop do
    print_menu
    menu(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to csv"
  puts "4. Load the students from csv"
  puts "9. Exit"
end

def menu(selection)
  menu = {
    "1" => method(:input_students),
    "2" => method(:show_students),
    "3" => method(:ask_for_filename_to_save),
    "4" => method(:ask_for_filename_to_load),
    "9" => method(:exit)
  } 
  if menu[selection] == nil
    puts "I don't understand, try again"
  else 
    menu[selection].()
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

def save_students(filename)
  #open the file for writing
  file = File.open(filename, "w")
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
  add_students(name, cohort)
  end
  file.close
end

def try_load_students(filename = "students.csv")
  filename = ARGV.first if !ARGV.first.nil?
  if File.exists?(filename) #if the file exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if the file doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def ask_for_filename_to_save
  puts "Please enter the file name to save to."
  filename = STDIN.gets.chomp
  save_students(filename)
end

def ask_for_filename_to_load
  puts "Please enter the file name to load from."
  filename = STDIN.gets.chomp
  load_students(filename)
end

def add_students(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu