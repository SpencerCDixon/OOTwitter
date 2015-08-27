require_relative 'twitter_user'
require_relative 'twitter_data'

class TwitterUsers
  attr_reader :users, :data

  def initialize(data: TwitterData.new)
    @data  = data
    @users = build_users
  end

  def descriptions
    users.each do |user|
      puts "#{user.username} - #{user.description}"
    end
  end

  def follower_counts
    users.each do |user|
      puts "#{user.username} - #{user.num_followers}"
    end
  end

  def last_twenty_length
    users.each do |user|
      puts "#{user.username} - #{user.last_twenty_tweet_length}"
    end
  end

  def latest_tweet_length
    users.each do |user|
      puts "#{user.username} - #{user.latest_tweet_length}"
    end
  end

  def most_followers
    sorted = users.sort_by(&:num_followers)
    puts "Most followers: #{sorted.last.username}"
  end

  def most_friends
    sorted = users.sort_by(&:num_friends)
    puts "Most friends: #{sorted.last.username}"
  end

  def most_tweets
    sorted = users.sort_by(&:num_tweets)
    puts "Most tweets: #{sorted.last.username}"
  end

  def with_description
    found = users.select(&:has_description?)
    found.each { |user| puts user.username }
  end

  def with_location
    found = users.select(&:has_location?)
    found.each { |user| puts user.username }
  end

  private

  def build_users
    data.each_with_object([]) do |user_hash, array|
      username  = user_hash.keys.first
      user_hash = user_hash[username]
      array << TwitterUser.new(username, user_hash)
    end
  end
end

twitter_users = TwitterUsers.new
twitter_users.descriptions
twitter_users.follower_counts
twitter_users.last_twenty_length
twitter_users.latest_tweet_length
twitter_users.most_followers
twitter_users.most_friends
twitter_users.most_tweets
twitter_users.with_description
twitter_users.with_location

