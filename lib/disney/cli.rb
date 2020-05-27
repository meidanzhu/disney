# keep track of interaction with user
# puts or get statements
# control flow
class CLI 
    
    def start
        puts "Welcome to Walt Disney World - Orlando"
        
        API.fetch_data
    end
end

