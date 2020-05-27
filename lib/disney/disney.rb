#keep track of all objects created 
#attractions, characters/entertainment, restaurants/dining, events/tours, lands
  # attractions => "attractions"
        # land => in lands > entertainment "name"
        # parks => "name"
        # characters => "characters"
        # dining => "dining"
        # events => "entertainment"
        # attractions => "attractions"

        #index[0, 1, 2, 3, 4] = Magic Kingdom, EPCOT, Animal Kingdom, Blizzard Beach, Typhoon Lagoon
       

class Park
    attr_accessor :name, :lands, :lands_array
    @@all =[]
    
    def initialize(name, lands_array)
        @@all << self
        @name = name
        @lands_array = lands_array
        @lands = []
    end

    def self.all
        @@all
    end

    def add_land(new_land)
        @lands << new_land
    end

    
end

class Land 
    attr_accessor :name, :land
    @@all = []

    def initialize(name)
        @name = name
    end
end
