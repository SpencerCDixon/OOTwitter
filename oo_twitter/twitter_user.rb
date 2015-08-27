require_relative 'tweet'

class TwitterUser
  attr_reader :description, :num_followers, :num_friends,
              :latest_tweet, :tweets, :location,
              :username, :num_tweets

  def initialize(username, user_hash)
    @username      = username
    @description   = user_hash['description'] || 'NA'
    @num_followers = user_hash['number of followers']
    @num_friends   = user_hash['number of friends']
    @num_tweets    = user_hash['number of tweets']
    @latest_tweet  = Tweet.new(user_hash['latest tweet'])
    @location      = user_hash['location'] || 'NA'
    @tweets        = build_tweets(user_hash['last twenty tweets'])
  end

  def has_description?
    description != 'NA'
  end

  def has_location?
    location != 'NA'
  end

  def latest_tweet_length
    latest_tweet.length
  end

  def last_twenty_tweet_length
    tweets.inject(0) { |sum, x| sum + x.length }
  end

  private

  def build_tweets(tweet_list)
    tweet_list.each_with_object([]) do |tweet_content, array|
      array << Tweet.new(tweet_content)
    end
  end
end
