"1".class # => String
1.class # => Fixnum
[].class # => Array
{}.class # => Hash

1 + 1
1.send(:+, 1)
1.+(1)

class String
  def bark
    self + " WOOF!"
  end
end

"The dog goes".bark # => "The dog goes WOOF!"
"Hello World".bark # => "Hello World WOOF!"

class Lamp
  def initialize
    @switch = "off"
  end

  def switch # aka attr_reader :switch
    @switch
  end

  def turn_on
    @switch = "on"
  end

  def turn_off
    @switch = "off"
  end
end

lamp = Lamp.new
lamp.switch # => "off"
lamp.turn_on
lamp.switch # => "on"

def twitter_data
  [
    {
      "LaunchAcademy" => {
        "description" => "desc",
        "last twenty tweets" => [ "tweet1", "tweet2" ],
        "number of followers" => 3590,
        "number of friends" => 699,
        "latest tweet" => "latest tweet",
        "number of tweets" => 1433,
        "location" => "Boston, MA"
      }
    },
    {
      "dpicket" => {
        "description" => "desc",
        "last twenty tweets" => [ "tweet1", "tweet2" ],
        "number of followers" => 1604,
        "number of friends" => 874,
        "latest tweet" => "latest tweet",
        "number of tweets" => 3451,
        "location" => "Boston, MA"
      }
    }
  ]
end
