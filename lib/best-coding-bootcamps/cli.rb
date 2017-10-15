class BestCodingBootcamps::CLI

  def call
    BestCodingBootcamps::Bootcamp.create_bootcamps
    puts "Best Coding Bootcamps in NYC"
    list_bootcamps
    menu
    exit
  end

  def list_bootcamps
    BestCodingBootcamps::Bootcamp.all.each_with_index do |b, i|
      puts "#{i+1}. #{b.cost}"
    end
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
