#keep track of interaction with api
class API 
    
    def self.fetch_data
        url = "https://disneyparksapi.firebaseio.com/.json"
        uri = URI(url)
        response = HTTParty.get(url)
        #response.parsed_response
        array_of_parks = response["orlando"]["parks"]

         (0..3).each do |park| 
            park_name = array_of_parks[park]["name"]
            lands_array = array_of_parks[park]["lands"]
            theme_park = Park.new(park_name, lands_array)
            lands_array.each do |land|
                land_name = land["name"]
                new_land = Land.new(land_name)
                theme_park.add_land(new_land)
            end

            theme_park.lands.each do |land|
                puts land.name
            end
            
        end


        #theme_park.each do |park|
           # theme_park.lands = park["lands"]
        
         
       # end
# land => in lands > entertainment "name"
        # parks => "name"
        # characters => "characters"
        # dining => "dining"
        # events => "entertainment"
        # attractions => "attractions"
    end
end

