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
    input = nil
    while input != "exit" do
      input = gets.strip.downcase
      if input ==  "list"
        list_bootcamps
      elsif input == "exit"
        exit
      elsif input.to_i > 0 && input.to_i <=10
        print_bootcamp(input.to_i)
        puts ""
        puts "Choose another bootcamp (1-10), type 'list' to see all bootcamps or 'exit' to close the app"
      else
        puts "Please enter a valid input"
      end
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

  def exit
    puts "Thank you! See you again soon."
    puts "The bootcamp information was taken from www.switchup.org"
  end

end
