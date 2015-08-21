require_relative 'twitter_user'
require_relative 'twitter_data'

class TwitterUsers
  attr_reader :users
  def initialize
    @users = build_users
  end

  def build_users
    data.each_with_object([]) do |user_hash, array|
      username  = user_hash.keys.first
      user_hash = user_hash[username]
      array << TwitterUser.new(username, user_hash)
    end
  end

  def username_description
    users.each do |user|
      puts "#{user.username} - #{user.description}"
    end
  end

  def username_followers
    users.each do |user|
      puts "#{user.username} - #{user.description}"
    end
  end

  def data
    @data ||= TwitterData.fetch
  end
end

users = TwitterUsers.new
users.username_description

