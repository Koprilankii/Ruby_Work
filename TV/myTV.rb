require_relative "ChannelTypeEnum"
class MyTV
    private 
    attr_accessor :channelsList

    def initialize()
        @channelsList = Array.new()
    end

    public 
    def addChannel(c) 
        self.channelsList.push(c)
    end

    def removeChannel(c) 
        self.channelsList.pop(c)
    end

    def iterator(type) 
        return TypeIterator.new(type, self.channelsList)
    end

    class TypeIterator
        private 
        attr_accessor :type, :channels, :position

        def initialize(type,  channels)
            @type = type
            @channels = channels
            @position = 0
        end

        public
        def add_cash()
            self.position = position + 1
        end

        def hasNext()
            while position < channels.size() do
                c = channels.at(position)
                if (CHANNEL_TYPE_ENUM[c.getType()] == CHANNEL_TYPE_ENUM[self.type]  || 
                    CHANNEL_TYPE_ENUM[self.type] == CHANNEL_TYPE_ENUM["ALL"])
                    return true
                else
                    add_cash()
                end
                return false
            end
        end

        def next() 
            c = channels.at(position)
            add_cash()
            return c
        end
    end
end