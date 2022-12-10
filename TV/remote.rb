require_relative "Channel"
require_relative "myTV"
require_relative "ChannelTypeEnum"

def main
    channels = populateChannels()


    puts "-- All Channel --"
    all_channel = channels.iterator("ALL")
    while all_channel.hasNext() do
        c = all_channel.next()
        puts c.toString()
    end

    puts "\n-- Sport Channel --"
    sport_channel = channels.iterator("SPORT")
    while sport_channel.hasNext() do
        c = sport_channel.next()
        puts c.toString()
    end
end

def populateChannels() 
    channels = MyTV.new()
    channels.addChannel(Channel.new(98.5, "SPORT"))
    channels.addChannel(Channel.new(99.5, "SPORT"))
    channels.addChannel(Channel.new(100.5, "MOVIES"))
    channels.addChannel(Channel.new(101.5, "MOVIES"))
    return channels
end

main()
