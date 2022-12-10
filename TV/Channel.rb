class Channel
    private 
    attr_accessor :frequency, :type

    def initialize(frequency, type)
        @frequency = frequency
        @type = type
    end

    public
    def getType
        return type
    end
    
    def getFrequency
        return frequency
    end

    def toString
        return "[ Frequency: #{self.frequency}, Type: #{self.type} ]"
    end
end

