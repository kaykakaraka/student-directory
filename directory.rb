#we create an array with all of the students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Coleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
puts "The students of Villains Academy"
puts "-------------"
#we use iteration to print the list of students
students.each do |student|
  puts student
end
#finally, we print the total number of students
puts "Overall, we have #{students.count} great students"