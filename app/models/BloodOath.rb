class BloodOath

@@all = []

attr_reader :initiation_date, :follower, :cult

    def initialize(follower, cult, initiation_date = Time.now.strftime("%Y-%m-%d"))
    @initiation_date = initiation_date.to_s
    @follower = follower
    @cult = cult
    @@all << self

    end

    def self.all
        @@all
    end
    

    def self.first_oath
        # Perhaps I'm overthinking this... 
        # are they asking for the earliest initiation_date? 
        # or the follower of the first instance in the BloodOath.all array?
        #if it's the latter, i've solved it. if it's the former, i could not do it
        @@allp[0].follower
    end

end

