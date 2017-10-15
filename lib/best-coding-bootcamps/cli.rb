class BestCodingBootcamps::CLI

  def call
    BestCodingBootcamps::Bootcamp.create_bootcamps
    puts "20 Best Coding Bootcamps in NYC"
    list_bootcamps
    menu
    exit
  end

  def list_bootcamps
    BestCodingBootcamps::Bootcamp.all.each_with_index do |b, i|
      puts "#{i+1}. #{b.name}"
    end
  end

  def menu
    puts "Please enter the bootcamp number to get more information"
    puts "Type 'list' to see the bootcamps again or 'exit'"
    input = nil
    while input != "exit" do
      input = gets.strip
      if input ==  "list"
        list_bootcamps
      elsif input.to_i > 0 && input.to_i <=20
        print_bootcamp(input.to_i)
        puts ""
        puts "Choose another bootcamp or type 'exit'"
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
    puts "The bootcamp information was taken from www.switchup.org "
  end

end
