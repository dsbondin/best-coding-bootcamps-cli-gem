class BestCodingBootcamps::CLI

  def call
    BestCodingBootcamps::Bootcamp.create_bootcamps
    list_bootcamps
    menu
  end

  def list_bootcamps
    puts ""
    puts "#{BestCodingBootcamps::Bootcamp.bootcamp_count} BEST CODING BOOTCAMPS IN NYC"
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
    elsif input.to_i.between?(1, BestCodingBootcamps::Bootcamp.all.size)
      print_bootcamp(input.to_i)
      puts "Choose another bootcamp, type 'list' to see all bootcamps or 'exit' to close the app"
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
    puts "---------------***---------------"
    puts ""
    puts "Would you like to visit bootcamp's website? Y/N"
    input = gets.strip
    if input == "y" || input == "Y"
      puts "Opening webpage..."
      # Launchy.open('http://www.ruby-lang.org/')
    end
  end

  # def visit_website
  #   puts "Would you like to visit bootcamp's website? Y/N"
  #   input = gets.strip
  #   if input == "y" || input == "Y"
  #     puts "Opening webpage..."
  #     system("start #{bootcamp.website_link}")
  #   end
  # end

  def exit
    puts ""
    puts "Thank you! See you again soon."
    puts "The information on bootcamps was taken from www.switchup.org"
  end

end
