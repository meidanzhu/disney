#keep track of interaction with api
class API 
    
    def self.fetch_data
        url = "https://disneyparksapi.firebaseio.com/.json"
        uri = URI(url)
        response = HTTParty.get(url)
        #response.parsed_response
        parks_array = response["orlando"]["parks"]

        (0..3).each do |park| 
            park_name = parks_array[park]["name"]
            theme_park = Park.new(park_name)

            lands_array = parks_array[park]["lands"]
            lands_array.each do |land|
                land_name = land["name"]
                new_land = Land.new(land_name)
                theme_park.add_land(new_land)

                attractions_array = land["attractions"]
                if attractions_array != nil
                    new_land.add_option("Enjoy The Attractions")
                    attractions_array.each do |attraction|
                        attraction_name = attraction["name"]
                        new_attraction = Attraction.new(attraction_name)
                        theme_park.add_attraction(new_attraction)
                        new_land.add_attraction(new_attraction)
                    end  
                end

                characters_array = land["characters"]
                if characters_array != nil
                    new_land.add_option("Greet The Characters")
                    characters_array.each do |character|
                        character_name = character["name"]
                        new_character = Character.new(character_name)
                        theme_park.add_character(new_character)
                        new_land.add_character(new_character)
                    end
                end

                dining_array = land["dining"]
                if dining_array != nil
                    new_land.add_option("Find Dining")
                    dining_array.each do |dining|
                        dining_name = dining["name"]
                        new_dining = Dining.new(dining_name)
                        theme_park.add_dining(new_dining)
                        new_land.add_dining(new_dining)
                    end
                end


            
            end 
        
        end

        # land => land "name" DONE
        # parks => "name" DONE
        # characters => "characters"
        # dining => "dining"
        # attractions => "attractions"
    end
end

