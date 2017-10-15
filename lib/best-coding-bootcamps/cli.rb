class BestCodingBootcamps::CLI

  def call
    puts "Best Coding Bootcamps in NYC"
    list_bootcamps
    menu
    exit
  end

  def list_bootcamps
    puts "1. App Academy"
    puts "2. Flatiron School"
  end

  def menu
    puts "Please enter the bootcamp number to get more information"
    puts "Type 'list' to see the bootcamps again or 'exit'"
    input = nil
    while input != "exit" do
      input = gets.strip
      case input
      when "list"
        list_bootcamps
      when "1"
        puts "more info on 1"
      when "2"
        puts "more info on 2"
      end
    end
  end

  def exit
    puts "Thank you! See you again soon."
  end

end
