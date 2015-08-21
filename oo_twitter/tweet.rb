class Tweet
  def initialize(content)
    @content = content || ''
  end

  def length
    @content.length
  end
end
