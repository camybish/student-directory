@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  prints
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, hit return twice"
    name = gets.chomp
    
    
    puts "Does this student have a favourite hobby"
    hobby = gets.strip
    
    puts "Are they in the november cohort or a different one? 
    (return if november)"
    cohort = gets.strip.to_sym
    
    
    while !name.empty? do 
        if cohort.empty?
            @students << { name: name, cohort: :november, likes: hobby }
        else
            @students << { name: name, cohort: cohort, likes: hobby }
        end
        stud = @students.count > 1 ? "students" : "student"
        puts "Now we have #{@students.count} #{stud}"
        name = gets.chomp
        puts "And their hobby?"
        hobby = gets.strip
        puts "Cohort? (return for november)"
        cohort = gets.strip
    end
    
    @students
    
end

def print_header
    puts "The students of Villains Academy"
    puts "-----------------".center(25)
end

def prints
    students_sorted = @students.sort_by { |student| student[:cohort].to_s }
    students_sorted.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort) likes #{student[:likes]}"
    end
    
end

def print_footer
    puts "Overall, we have #{@students.count} great students\n\n"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu