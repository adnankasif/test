class Tournament

  WIN_POINTS = 3
  LOSE_POINTS = 0
  DRAW_POINTS = 1
  
  def initialize
    get_input  
  end
  
  def get_input
    @input_arr = []

    loop do
      puts "Enter first team"
      first_team = gets.chomp

      puts "Enter second team"
      second_team = gets.chomp

      if first_team == second_team
        puts "teams can't be same" 
        next
      end

      puts "Enter win/lose/draw"
      result = gets.chomp.downcase

      unless ["win","lose","draw"].include?(result)
        puts "Invalid Input"
        next
      end

      @input_arr << [first_team, second_team, result]

      puts "Do you have another Entry to add? (yes/no)"
      response = gets.chomp!

      break if response.downcase == "no"
    end
    find_winner
  end

  def find_winner
    keys = {'MP' => 0, 'W' => 0, 'L' => 0, 'D' => 0, 'P' => 0}
    record_hash = {}

    @input_arr.each do |rec|
      record_hash[rec[0]] = keys.clone unless record_hash.has_key?(rec[0])
      record_hash[rec[1]] = keys.clone unless record_hash.has_key?(rec[1])

      record_hash[rec[0]]["MP"] += 1
      record_hash[rec[1]]["MP"] += 1

      case rec[2]
      when 'win'
        record_hash[rec[0]]["W"] += 1
        record_hash[rec[1]]["L"] += 1
        record_hash[rec[0]]["P"] += WIN_POINTS
      when 'lose'
        record_hash[rec[0]]["L"] += 1
        record_hash[rec[1]]["W"] += 1
        record_hash[rec[1]]["P"] += WIN_POINTS
      when 'draw'
        record_hash[rec[0]]["D"] += 1
        record_hash[rec[1]]["D"] += 1
        record_hash[rec[0]]["P"] += DRAW_POINTS
        record_hash[rec[1]]["P"] += DRAW_POINTS
      end
    end

    display_output(record_hash)
  end
  
  def display_output(record_hash)
    sorted_hash = Hash[record_hash.sort.sort_by {|k,v| -v["P"]}]

    puts 'Team | MP | W | L | D | P'

    sorted_hash.to_a.each do |index, values|
      puts "#{index}  | #{sorted_hash[index]["MP"]} | #{sorted_hash[index]["W"]} | #{sorted_hash[index]["L"]} | #{sorted_hash[index]["D"]} | #{sorted_hash[index]["P"]}"
    end
  end
end
    
Tournament.new
