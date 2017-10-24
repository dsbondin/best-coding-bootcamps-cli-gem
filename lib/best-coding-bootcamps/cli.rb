class BestCodingBootcamps::CLI

  def call
    BestCodingBootcamps::Bootcamp.create_bootcamps
    list_bootcamps
    menu
  end

  def list_bootcamps
    puts ""
    puts "10 BEST CODING BOOTCAMPS IN NYC"
    puts ""
    BestCodingBootcamps::Bootcamp.all.each_with_index do |b, i|
      puts "#{i+1}. #{b.name}"
    end
    request_input
  end

  def request_input
    puts ""
    puts "Please enter the bootcamp number to get more information"
    puts "Type 'exit' to close the app"
  end

  def menu
    puts ""
    input = gets.strip.downcase
    if input ==  "list"
      list_bootcamps
      menu
    elsif input == "exit"
      exit
    elsif input.to_i > 0 && input.to_i <=10
      print_bootcamp(input.to_i)
      puts ""
      puts "Choose another bootcamp (1-10), type 'list' to see all bootcamps or 'exit' to close the app"
      menu
    else
      puts "Please enter a valid input"
      menu
    end
  end

  def print_bootcamp(input)
    bootcamp = BestCodingBootcamps::Bootcamp.find_bootcamp(input)
    puts "---------- #{bootcamp.name} ----------"
    puts "Ranking:       #{bootcamp.ranking}"
    puts ""
    puts "DESCRIPTION:"
    puts bootcamp.about
    puts ""
    puts "COURSES:"
    bootcamp.courses.each { |c| puts c}
  end

  def visit_website
    puts ""
    puts "Would you like to visit bootcamp's website? Y/N"
    input = gets.strip

    case input
    when "y" || "Y"
      puts "Opening webpage..."
      #goto website
    when "n" || "N"
      puts ""
    when "exit"
      exit
    when "list"
      list_bootcamps
      menu
    else
      visit_website
    end
  end

  def exit
    puts ""
    puts "Thank you! See you again soon."
    puts "The bootcamp information was taken from www.switchup.org"
  end

end
