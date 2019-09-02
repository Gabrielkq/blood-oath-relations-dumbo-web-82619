class Cult

    @@all = []
    attr_reader :name, :location, :founding_year, :slogan, :minimum_age

    def initialize(name, location, founding_year, slogan, minimum_age)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
        
    end

    def self.all
        @@all << self
    end

    def recruit_follower(follower)
        if follower.age >= self.minimum_age
       BloodOath.new(follower, self)
        else
            puts "Sorry, but you are too young to drink our Koolaid"
        end
     puts
    end

    def cult_population
        population = 
        BloodOath.all.select do |oath|
        oath.cult.name == self.name
        end
        population.size
    end

    def self.find_by_name(name)
        self.all.find do |cultvar|
            cultvar.name == name
        end
    end

    def self.find_by_location(location_var)
        residents = @@all.select do |cultvar|
            cultvar.location == location_var
        end
    end

    def self.find_by_founding_year(year)
        thatyear = @@all.select do |cultvar|
            cultvar.founding_year == year
        end
    end

    def cultfollowers
       congregation = BloodOath.all.select do |oath|
        oath.cult.name == self.name
        # binding.pry
        # 0
       end
        congregation.map do |oath|
            oath.follower
        end
    end

    def average_age
       agetotal = 0
       agesize = 0
         cultfollowers.each do |oath|
           agetotal += oath.follower.age
           agesize += 1
        #    binding.pry
        #    0
        end
        agetotal.to_f / agesize
    end

    def my_followers_mottos
        # mottoarray = []
        cultfollowers.each do |oath|
        # mottoarray << oath.follower.life_motto
        puts oath.follower.life_motto 
        # binding.pry
        # 0
    end
    puts
    end

    def self.least_popular
        tinycult = BloodOath.all.min_by { |i| BloodOath.all.count(i) }
        tinycult.cult
    end
    
    def self.most_common_location
        popularplace = @@all.max_by { |i| @@all.count(i) }
        popularplace.location
    end


    
    
end

