# keep track of interaction with user
# puts or get statements
# control flow
class CLI

    def initialize
        API.fetch_data
        start
    end

    def start
        banner = """

        ██     ██  █████  ██   ████████     ██████  ██ ███████ ███    ██ ███████ ██    ██     ██     ██  ██████  ██████  ██      ██████  
        ██     ██ ██   ██ ██      ██        ██   ██ ██ ██      ████   ██ ██       ██  ██      ██     ██ ██    ██ ██   ██ ██      ██   ██ 
        ██  █  ██ ███████ ██      ██        ██   ██ ██ ███████ ██ ██  ██ █████     ████       ██  █  ██ ██    ██ ██████  ██      ██   ██ 
        ██ ███ ██ ██   ██ ██      ██        ██   ██ ██      ██ ██  ██ ██ ██         ██        ██ ███ ██ ██    ██ ██   ██ ██      ██   ██ 
         ███ ███  ██   ██ ███████ ██        ██████  ██ ███████ ██   ████ ███████    ██         ███ ███   ██████  ██   ██ ███████ ██████     
        """
        puts banner 
        puts "\nWelcome to Walt Disney World Resort- Orlando. You may leave the park by typing 'exit'."

        theme_park = explore_park
        if theme_park == -1
            end_exploration
        end

        land = explore_land(theme_park)
        if land == -1
            end_exploration
        end
        
        option = explore_options(land)
        if option == -1
            end_exploration
        end

        if land.options[option-1] == "Enjoy The Attractions"
            attraction = explore_attractions(land)
            if attraction == -1
                end_exploration
            end
            attraction.interact

        elsif land.options[option-1] == "Greet The Characters"
            character = explore_characters(land)
            if character == -1
                end_exploration
            end
            character.interact

        elsif land.options[option-1] == "Find Dining"
            dining = explore_dining(land)
            if dining == -1
                end_exploration
            end
            dining.interact
        else
            return "Sorry, there was an option error."
        end

        restart_exploration(theme_park,land,option)

    end 

    def end_exploration

        puts "\nHope you had a magical time here at Walt Disney World!\n Type 'restart' to explore again."
        
        while true
            input = gets.chomp.downcase
            if input == "restart"
                break
            end
        end

        start
    end

    def restart_exploration(theme_park, land, option)
        
        puts "When you are ready to head back, type where you would like to go back."
        puts "1. See More Parks"
        puts "2. See More Land"
        puts "3. See More Options"
        puts "4. #{land.options[option-1]} Again"

        while true
            input = gets.chomp

            if input == "exit"
                return -1
            end
            
            # Check to have valid input 
            if input.to_i == 0 || (input.to_i != 0 && input.to_i.between?(1,4) == false)
                puts "Sorry, this option is invalid. Try again."
            else
                break 
            end
        end

        case input.to_i
        when 1
            explore_park_again
        when 2
            explore_land_again(theme_park)
        when 3
            explore_options_again(theme_park,land)
        when 4
            if land.options[option-1] == "Enjoy The Attractions"
                explore_attractions_again(theme_park, land, option)
            elsif land.options[option-1] == "Greet The Characters"
                explore_characters_again(theme_park, land, option)
            elsif land.options[option-1] == "Find Dining"
                explore_dining_again(theme_park, land, option)
            else
                puts "Sorry, there was an error in your option"
                end_exploration
            end
        else
            puts "Sorry, there was an error in your option"
            end_exploration
        end
            
    end

    def explore_park

        puts "\nWhich park would you like to visit? \n Type the number:"
    
        Park.all.each.with_index(1) do |park, index|
            puts "#{index}. #{park.name}"
        end

        while true
            input = gets.chomp

            if input == "exit"
                return -1
            end
            
            # Check to have valid input 
            if input.to_i == 0 || (input.to_i != 0 && input.to_i.between?(1,Park.all.length) == false)
                puts "Sorry, this option is invalid. Try again."
            else
                break 
            end  
        end

        theme_park = Park.all[input.to_i-1]
        return theme_park
    end        

    def explore_land(theme_park)

        lands = theme_park.lands

        puts "\nWelcome to #{theme_park.name}!"
        puts "Which land would you like to visit in #{theme_park.name}?\nType the number:"

        lands.each.with_index(1) do |land, index|
            puts "#{index}. #{land.name}"
        end

        while true
            input = gets.chomp

            if input == "exit"
                return -1
            end
            
            if input.to_i == 0 || (input.to_i != 0 && input.to_i.between?(1,lands.length) == false)
                puts "Sorry, this option is invalid. Try again."
            else
                break
            end
        end

        land = lands[input.to_i-1]
        return land
    end

    def explore_options(land)

        options = land.options

        puts "\nWelcome to #{land.name}!"
        puts "What would you like to do in #{land.name}?"
    
        options.each.with_index do |option, index|
            puts "#{index+1}. #{option}"
        end

        while true
            input = gets.chomp

            if input == "exit"
                return -1
            end

            if input.to_i == 0 || (input.to_i != 0 && input.to_i.between?(1,options.length) == false)
                puts "Sorry, this option is invalid. Try again."
            else
                break
            end

        end
    
        return input.to_i
    end

    def explore_attractions(land)

        attractions = land.attractions

        puts "Look for these attraction(s) and enjoy the ride."
        attractions.each.with_index(1) do |attraction, index|
            puts "#{index}.  #{attraction.name}"
        end

        while true
            input = gets.chomp

            if input == "exit"
                return -1
            end
            
            if input.to_i == 0 || (input.to_i != 0 && input.to_i.between?(1,attractions.length) == false)
                puts "Sorry, this option is invalid. Try again."
            else
                break 
            end  
        end

        attraction = attractions[input.to_i-1]
        return attraction
    end

    def explore_characters(land)

        characters = land.characters

        puts "You can find these character(s) here"
        characters.each.with_index(1) do |character, index|
            puts "#{index}.  #{character.name}"
        end

        while true
            input = gets.chomp

            if input == "exit"
                return -1
            end
            
            if input.to_i == 0 || (input.to_i != 0 && input.to_i.between?(1,characters.length) == false)
                puts "Sorry, this option is invalid. Try again."
            else
                break 
            end  
        end

        character = characters[input.to_i-1]
        return character
    end

    def explore_dining(land)

        dining_array = land.dining

        puts "Now serving the best meals here:"
        puts "Enjoy the food!"
        
        dining_array.each.with_index(1) do |dining, index|
            puts "#{index}.  #{dining.name}"
        end

        while true
            input = gets.chomp

            if input == "exit"
                return -1
            end

            if input.to_i == 0 || (input.to_i != 0 && input.to_i.between?(1,dining_array.length) == false)
                puts "Sorry, this option is invalid. Try again."
            else
                break 
            end  
        end

        dining = dining_array[input.to_i-1]
        return dining
        
    end


    def explore_park_again

        theme_park = explore_park()
        if theme_park == -1
            end_exploration
        end

        land = explore_land(theme_park)
        if land == -1
            end_exploration
        end
        
        option = explore_options(land)
        if option == -1
            end_exploration
        end

        if land.options[option-1] == "Enjoy The Attractions"
            attraction = explore_attractions(land)
            if attraction == -1
                end_exploration()
            end
            attraction.interact

        elsif land.options[option-1] == "Greet The Characters"
            character = explore_characters(land)
            if character == -1
                end_exploration
            end
            character.interact

        elsif land.options[option-1] == "Find Dining"
            dining = explore_dining(land)
            if dining == -1
                end_exploration
            end
            dining.interact
        else
            return "Sorry, there was an option error."
        end

        restart_exploration(theme_park,land,option)

    end

    def explore_land_again(theme_park)

        land = explore_land(theme_park)
        if land == -1
            end_exploration
        end
        
        option = explore_options(land)
        if option == -1
            end_exploration
        end

        if land.options[option-1] == "Enjoy The Attractions"
            attraction = explore_attractions(land)
            if attraction == -1
                end_exploration
            end
            attraction.interact

        elsif land.options[option-1] == "Greet The Characters"
            character = explore_characters(land)
            if character == -1
                end_exploration
            end
            character.interact

        elsif land.options[option-1] == "Find Dining"
            dining = explore_dining(land)
            if dining == -1
                end_exploration
            end
            dining.interact
        else
            return "Sorry, there was an option error."
        end

        restart_exploration(theme_park,land,option)

    end

    def explore_options_again(theme_park,land)

        option = explore_options(land)
        if option == -1
            end_exploration
        end

        if land.options[option-1] == "Enjoy The Attractions"
            attraction = explore_attractions(land)
            if attraction == -1
                end_exploration
            end
            attraction.interact

        elsif land.options[option-1] == "Greet The Characters"
            character = explore_characters(land)
            if character == -1
                end_exploration
            end
            character.interact

        elsif land.options[option-1] == "Find Dining"
            dining = explore_dining(land)
            if dining == -1
                end_exploration
            end
            dining.interact
        else
            return "Sorry, there was an option error."
        end

        restart_exploration(theme_park,land,option)

    end
    
    def explore_attractions_again(theme_park,land,option)

        attraction = explore_attractions(land)
        if attraction == -1
            end_exploration
        end
        attraction.interact
        restart_exploration(theme_park,land,option)

    end

    def explore_characters_again(theme_park,land,option)

        character = explore_characters(land)
        if character == -1
            end_exploration
        end
        character.interact
        restart_exploration(theme_park,land,option)

    end

    def explore_dining_again(theme_park,land,option)

        dining = explore_dining(land)
        if dining == -1
            .end_exploration
        end
        dining.interact
        restart_exploration(theme_park,land,option)

    end


        # Select the park that user choose Park.all[input.to_i-1] <-- save as a variable
        # Grab the land inside and iterate through (repeat after)
        # After they choose park #2, next step is to show list of lands in park #2.

        # binding.pry
        #puts "Which land would you like to go to?"

        #puts "Welcome to land. What would you like to view here?"
    
end
