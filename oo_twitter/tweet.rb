class Tweet
  def initialize(content)
    @content = content || ''
  end

  def to_s
    @content
  end

  def length
    @content.length
  end
end

# tweet = Tweet.new('Ruby is the best!')
# => #<Tweet:0x007ffef54c2f38 @content="Ruby is the best!">

# tweet.length
# => 17

# "#{tweet} - interpolated tweet"
# => "Ruby is the best! - interpolated tweet"
