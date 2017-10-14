class BestCodingBootcamps::CLI

  def call
    puts "Best Coding Bootcamps in NYC"
    list_bootcamps
    menu
  end

  def list_bootcamps
    puts "1. App Academy"
    puts "2. Flatiron School"
  end

  def menu
    puts "Please enter the bootcamp number to get more information"
    input = gets.strip.to_i
    case input
    when 1
      puts "more info on 1"
    when 2
      puts "more info on 2"
    end
    end

  end

end
