# keep track of interaction with user
# puts or get statements
# control flow
class CLI 
    
    def start
        API.fetch_data
        
        input = ""
        index = 0
       
        while input != "exit"

            puts "Welcome to Walt Disney World - Orlando"
            puts "Which park would you like to go to?"
                puts "#{index+1}. #{theme_park.name}"

            puts "Which land would you like to go to?"

            puts "Welcome to land. What would you like to view here?"
        end
    end
end

