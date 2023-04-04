def input_students
    puts "Please enter the names of the students"
    puts "To finish, hit return twice"
    
    students = []
    
    name = gets.chomp
    
    while !name.empty? do 
        students << { name: name, cohort: :november }
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
  students.each.with_index(1) do |students, number|
    puts "#{number}: #{students[:name]} (#{students[:cohort]} cohort)"
  end
  puts students.select { |students| students[:name].length < 8 }
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)