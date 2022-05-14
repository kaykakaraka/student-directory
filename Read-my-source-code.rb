
file = File.open(__FILE__, "r") { |file|
  file.readlines.each do |line| 
    puts line
  end
}

