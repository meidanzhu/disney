#keep track of all objects created 
#attractions, characters/entertainment, restaurants/dining, events/tours, lands
  # attractions => "attractions"
        # land => lands
        # parks => "name"
        # characters => "characters"
        # dining => "dining"
        # attractions => "attractions"

        #index[0, 1, 2, 3] = Magic Kingdom, EPCOT, Hollywood Studios, Animal Kingdom
       

class Park
    attr_accessor :name, :lands, :characters, :dining, :attractions

    @@all =[]
    
    def initialize(name)
        @@all << self
        @name = name
        @lands = []
        @characters = []
        @dining = []
        @attractions = []
    end

    def self.all
        @@all
    end

    def add_land(new_land)
        @lands << new_land
    end

    def add_character(new_character)
        @characters << new_character
    end

    def add_dining(new_dining)
        @dining << new_dining
    end

    def add_attraction(new_attraction)
        @attractions << new_attraction
    end


    
end

class Land 
    attr_accessor :name, :characters, :dining, :attractions
    @@all = []

    def initialize(name)
        @@all << self
        @name = name
        @characters = []
        @dining = []
        @attractions = []
    end

    def self.all
        @@all
    end

    def add_character(new_character)
        @characters << new_character
    end

    def add_dining(new_dining)
        @dining << new_dining
    end

    def add_attraction(new_attraction)
        @attractions << new_attraction
    end

end

class Character
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
    end

end

class Dining
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
    end
end

class Attraction 
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
    end
end

