def input_students
    puts "Please enter the names of the students"
    puts "To finish, hit return twice"
    
    students = []
    
    name = gets.chomp
    
    puts "Does this student have a favourite hobby"
    hobby = gets.strip
    
    puts "Are they in the november cohort or a different one? 
    (return if november)"
    cohort = gets.strip.to_sym
    
    
    while !name.empty? do 
        if cohort.empty?
            students << { name: name, cohort: :november, likes: hobby }
        else
            students << { name: name, cohort: cohort, likes: hobby }
        end
        stud = students.count > 1 ? "students" : "student"
        puts "Now we have #{students.count} #{stud}"
        name = gets.chomp
        puts "And their hobby?"
        hobby = gets.chomp
        puts "Cohort? (return for november)"
        cohort = gets.chomp
    end
    
    students
    
end

def print_header
    puts "The students of Villains Academy"
    puts "-----------------".center(25)
end

def print(students)
    students_sorted = students.sort_by { |student| student[:cohort].to_s }
    students_sorted.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort) likes #{student[:likes]}"
    end
    
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)