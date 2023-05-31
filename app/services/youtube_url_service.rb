class YoutubeUrlService
  class << self
    def parse_id(url:)
      between(url, "v=", "&")
    end

    def between(value, left, right)
    # Search from the start.
    pos1 = value.index(left)
    return "" if pos1 == nil
    pos1 += left.length
    
    # Search from the end.
    pos2 = value.rindex(right)
    return "" if pos2 == nil
    
    # Return a substring.
    return value[pos1, pos2 - pos1]
end 
  end
end
