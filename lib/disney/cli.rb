# keep track of interaction with user
# puts or get statements
# control flow
class CLI 
    
    def start
        API.fetch_data

            puts "Welcome to Walt Disney World - Orlando"
            sleep(1.0)
            puts "Which park would you like to visit? \n Type the number:"
    
        Park.all.each.with_index(1) do |park, index|
            puts "#{index}. #{park.name}"
        end

        while true
            input = gets.chomp.downcase

            if input == "exit"
                return "Goodbye!"
            end
            
            # Check to have valid input 
            if input.to_i != 0 && input.to_i.between?(1,Park.all.length) == false
                puts "Sorry, this option is invalid. Try again."
            else
                break 
            end  
        end
        
        theme_park = Park.all[input.to_i-1]
        lands = theme_park.lands
        

            puts "Welcome to #{theme_park.name}!"
            puts "Which land would you like to visit in #{theme_park.name}?"

            lands.each.with_index(1) do |land, index|
             puts "#{index}. #{land.name}"
             end

             while true
                input = gets.chomp.downcase
    
                if input == "exit"
                    return "Goodbye!"
                end
                
                if input.to_i != 0 && input.to_i.between?(1,lands.length) == false
                    puts "Sorry, this option is invalid. Try again."
                else
                    break 
                end  
            end

            land = lands[input.to_i-1]
            attractions = land.attractions
            characters = land.characters
            dining = land.dining

            puts "Welcome to #{land.name}!"
            puts "What would you like to do in #{land.name}?"
            puts "Fun Attractions:"
            attractions.each.with_index(1) do |attraction, index|
            puts "\u2022  #{attraction.name}"
            end
                        
            puts "\n"
            puts "Characters Here:"
            characters.each.with_index(1) do |character, index|
            puts "\u2022  #{character.name}"
            end
             
            puts "\n"
            puts "Dining Options:"
            dining.each.with_index(1) do |dining, index|
            puts "\u2022 #{dining.name}"
            end 

            puts "\n"
            puts "Hope you had a magical time here at Walt Disney World Orlando!\n Type 'exit' to restart."

            

        # Select the park that user choose Park.all[input.to_i-1] <-- save as a variable
        # Grab the land inside and iterate through (repeat after)
        # After they choose park #2, next step is to show list of lands in park #2.

        # binding.pry
        #puts "Which land would you like to go to?"

        #puts "Welcome to land. What would you like to view here?"
    
    end
end

