require 'pry'
require_relative 'tweet'

class TwitterUser
  attr_reader :description, :num_followers, :num_friends,
              :latest_tweet, :tweets, :location, :username

  def initialize(username, user_hash)
    @username      = username
    @description   = user_hash["description"] || "NA"
    @num_followers = user_hash["number of followers"]
    @num_friends   = user_hash["number of friends"]
    @latest_tweet  = Tweet.new(user_hash.fetch("latest tweet"))
    @location      = user_hash["location"] || "NA"
    @tweets        = build_tweets(user_hash["last twenty tweets"])
  end

  private

  def build_tweets(tweet_list)
    tweet_list.each_with_object([]) do |tweet_content, array|
      array << Tweet.new(tweet_content)
    end
  end
end
