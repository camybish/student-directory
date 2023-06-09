@students = []
require 'csv'

def print_menu
  puts "(Loaded from #{__FILE__})"
  puts "\n\n~~Villains Academy: Student Directory~~"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list" 
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
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, hit return twice"
    name = STDIN.gets.chomp
    
    
    puts "Does this student have a favourite hobby"
    hobby = STDIN.gets.strip
    
    puts "Are they in the november cohort or a different one? 
    (return if november)"
    cohort = STDIN.gets.strip.to_sym
    
    
    while !name.empty? do 
        if cohort.empty?
            @students << { name: name, cohort: :november, likes: hobby }
        else
            @students << { name: name, cohort: cohort, likes: hobby }
        end
        stud = @students.count > 1 ? "students" : "student"
        puts "Now we have #{@students.count} #{stud}"
        name = STDIN.gets.chomp
        puts "And their hobby?"
        hobby = STDIN.gets.strip
        puts "Cohort? (return for november)"
        cohort = STDIN.gets.strip
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
  if @students.any?
    puts "what would you like to call this file?"
    input = STDIN.gets.chomp
    CSV.open("./.gitignore/" + input + ".csv", "w") do |csv|
      @students.each do |student|
        csv << [student[:name], student[:cohort], student[:likes]]
      end
    end
  puts "#{input} was saved successfully"
  else
    puts "No data to save"
  end
end

def load_students
  puts "What file do you want to load?"
  input = STDIN.gets.chomp
  filename = "./.gitignore/" + input + ".csv"
  if File.exist?(filename)
    CSV.foreach(filename) do |row|
        name, cohort, likes = row
        @students << {name: name, cohort: cohort.to_sym, likes: likes}
      end
    puts "Loaded Successfully"
  else
    puts "Could not find Save file"
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
      puts "Loaded #{students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

try_load_students

interactive_menu