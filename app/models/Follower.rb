class Follower
    
    @@all = []
    attr_accessor :name, :age, :life_motto

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
        
    end

    def self.all
        @@all << self
    end

    def join_cult(cult)
        if self.age <= cult.minimum_age
            puts "Sorry, but you are too young to drink our Koolaid"
        else  BloodOath.new(self, cult)
        #   puts
        end
        end


   def cults
    cultsjoined =
        BloodOath.all.select do |oath|
        oath.follower.name == self.name
        end
        cultsjoined.map do |cult|
            cult.cult
    end
   end
   
   def self.of_a_certain_age(age)
    elders = @@all.select do |follower|
        follower.age >= age  
        end
    end

    def my_cults_slogans
        cults.each do |sloganvar|
            puts sloganvar.cult.slogan
        end
        puts
    end

    def self.most_active
        
        cultslut = BloodOath.all.map do |oath|
            oath.follower
            # binding.pry
            # 0
           end
        cultslut.max_by { |i| cultslut.count(i) }
    end

    def self.top_ten
        mostactive = BloodOath.all.map do |oath|
            oath.follower
            # binding.pry
            # 0
           end
           mostactive.group_by { |i| mostactive.count(i) }
           .sort_by  { |k, v| -k }
           .map(&:last)
           .flatten
           .uniq
           .first(10)
        end

    def fellow_cult_members
        brethren =
        self.cults.map do |shared_cult|
        shared_cult.cultfollowers
        end
        brethren.flatten.uniq - [self]
    end


end